MAKEFLAGS += --no-print-directory -s
BIN_NAME=paraphore
SHELL=/bin/bash
ARGS=-debug -D internal 
LOOP_TIME=30

DEV_TOOLS_LOC=../../../../DevTools
ASSET_LOC=../assets
BIN_LOC=../bin

HAXELIB_LOC=$(DEV_TOOLS_LOC)/haxelib
PLATFORM_LAYER_LOC=$(DEV_TOOLS_LOC)/platformLayer
HTML_LIB_LOC=$(DEV_TOOLS_LOC)/html/libs
HTML_TEMPLATE_LOC=$(DEV_TOOLS_LOC)/html/webglTemplate.html

ifeq ($(shell uname), Linux)
	FP_COMMAND=wine $(DEV_TOOLS_LOC)/players/flashplayer_24_sa_debug.exe
	BROWSER_COMMAND=xdg-open
	PYTHON3_COMMAND=python3
	OS=linux
endif

ifeq ($(shell uname), Darwin)
	FP_COMMAND=open /Applications/Flash\ Player\ Debugger.app
	BROWSER_COMMAND=open 
	PYTHON3_COMMAND=python3
endif

ifneq (, $(findstring MSYS_NT, $(shell uname)))
	FP_COMMAND=$(DEV_TOOLS_LOC)/players/flashplayer_24_sa_debug.exe
	BROWSER_COMMAND=start 
	PYTHON3_COMMAND=python
	OS=win32
endif

ifeq ($(shell echo $$USERNAME), MintPaw)
	PARAPHORE_COM := /d/paraphore.com
endif

ifeq ($(shell echo $$USERNAME), Amaranta)
	PARAPHORE_COM := ../../mintykitt/EroGame/Mint/other/paraphore.com
endif

# ifeq ($(shell hostname), fallowwing-VirtualBox)
# endif

all:
	make flash

include Makefile_extend

flash:
	make b r

webgl:
	make bwebgl rwebgl

b:
	make bflash

clean:
	rm -rf $(BIN_LOC)/*
	mkdir $(BIN_LOC)/webgl

r:
	$(FP_COMMAND) $(BIN_LOC)/$(BIN_NAME).swf

rwebgl:
	clear; cd $(BIN_LOC)/webgl; $(BROWSER_COMMAND) 'http://127.0.0.1:8000' & $(PYTHON3_COMMAND) -m http.server

updateAssets:
	make setLibs
	time haxelib run openfl update flash -DOPENFL_ENGINE -DupdateAssets -verbose -debug

buildApiDocs:
	rm -rf docs.txt
	grep "public static var" src/StaticExtern.hx > functions.txt
	sed -i 's/.*public static var //' functions.txt
	
	cp functions.txt fnList.txt
	sed -i 's/ =.*//' fnList.txt
	
	sed -i 's/:.*//' functions.txt
	
	echo "Building api docs"; \
		for line in `cat functions.txt`; do \
		echo $$line; \
		grep -r "public.*function $$line(" src $(DEV_TOOLS_LOC)/platformLayer | head -1 >> docs.txt; \
		done
	sed -i 's/.*public.*function //' docs.txt
	sed -i 's/{.*//' docs.txt
	uniq docs.txt > docsNoRep.txt
	rm docs.txt
	rm functions.txt
	mv docsNoRep.txt docs.txt
	
	# sort docs.txt -o docs.txt
	# sort functions.txt -o functions.txt

rasterizeFonts:
	rm -f $(ASSET_LOC)/font/bitmap/*.png
	rm -f $(ASSET_LOC)/font/bitmap/*.fnt
	fontSets=( \
									"OpenSans-Regular 8" \
									"OpenSans-Regular 10" \
									"OpenSans-Regular 14" \
									"OpenSans-Regular 16" \
									"OpenSans-Regular 20" \
									"OpenSans-Regular 24" \
									"OpenSans-Bold 14" \
									"OpenSans-Bold 20" \
									"OpenSans-Italic 14" \
									"OpenSans-Italic 20" \
									); \
									for set in "$${fontSets[@]}"; do \
									arr=($$set); \
									fontName=$${arr[0]}; \
									fontSize=$${arr[1]}; \
									fontSize=$$((fontSize + 2)); \
									echo $$fontName at $$fontSize; \
									sed -i "s/fontFile=.*/fontFile=\.\.\/$$fontName\.ttf/g" $(ASSET_LOC)/font/bitmap/dummy.bmfc; \
									sed -i "s/fontName=.*/fontName=$$fontName/g" $(ASSET_LOC)/font/bitmap/dummy.bmfc; \
									sed -i "s/isItalic=.*/isItalic=0/g" $(ASSET_LOC)/font/bitmap/dummy.bmfc; \
									sed -i "s/isBold=.*/isBold=0/g" $(ASSET_LOC)/font/bitmap/dummy.bmfc; \
									sed -i "s/fontSize=.*/fontSize=$$fontSize/g" $(ASSET_LOC)/font/bitmap/dummy.bmfc; \
									if [[ $$fontName == *"Italic"* ]]; then sed -i "s/isItalic=.*/isItalic=1/g" $(ASSET_LOC)/font/bitmap/dummy.bmfc; fi; \
									if [[ $$fontName == *"Bold"* ]]; then sed -i "s/isBold=.*/isBold=1/g" $(ASSET_LOC)/font/bitmap/dummy.bmfc; fi; \
									bmfont64 -c "$(ASSET_LOC)/font/bitmap/dummy.bmfc" -o "$(ASSET_LOC)/font/bitmap/$${fontName}_$${fontSize}"; \
									done; \

setLibs:
	haxelib setup ~/dummyLibDir
	haxelib dev openfl $(HAXELIB_LOC)/openfl
	haxelib dev lime $(HAXELIB_LOC)/lime
	haxelib dev hscript $(HAXELIB_LOC)/hscript
	haxelib dev hxinflate $(HAXELIB_LOC)/hxinflate
	haxelib dev actuate $(HAXELIB_LOC)/actuate
	haxelib dev mt $(HAXELIB_LOC)/mt
	haxelib dev hxmath $(HAXELIB_LOC)/hxmath
	haxelib dev format $(HAXELIB_LOC)/format
	haxelib dev hxcpp $(HAXELIB_LOC)/hxcpp

ctags:
	rm -f tags
	ctags --languages=haxe -R . /usr/lib/haxe/std $(HAXELIB_LOC)/openfl $(HAXELIB_LOC)/lime $(HAXELIB_LOC)/hxinflate $(HAXELIB_LOC)/actuate

loop:
	clear
	@echo "Please wait..."
	@watch -c -n $(LOOP_TIME) "if ! make b; then aplay ../other/alert.wav; fi"

bflash:
	echo Building flash...
	IFS=$$'\n'; \
					assetVar=""; \
					for f in `find $(ASSET_LOC)/swf/*.swf -type f`; do \
					assetVar="$$assetVar -resource $$f@swf:lib/`basename $$f .swf`/`basename $$f`"; \
					done; \
					IFS=$$' '; \
					out=`haxe -main ApplicationMain --macro "openfl._internal.utils.ExtraParams.include()" -cp $(HAXELIB_LOC)/openfl -D openfl=4.9.0 --macro "lime.Lib.extraParams()" -cp $(HAXELIB_LOC)/lime -D lime=4.0.0 -cp $(HAXELIB_LOC)/actuate -cp $(HAXELIB_LOC)/mt -D actuate=1.8.7 --macro "keep('IntIterator')" -cp $(HAXELIB_LOC)/hscript -D hscript=2.0.7 -cp $(HAXELIB_LOC)/hxinflate -D hxinflate=0.3.0 -cp $(ASSET_LOC)/openflManifest/flash/debug/haxe/_generated -cp src -cp $(HAXELIB_LOC)/openfl/externs/core/flash -cp $(HAXELIB_LOC)/openfl/externs/core/openfl -D native-trace -D tools=4.0.0 -cp $(HAXELIB_LOC)/format -cp $(PLATFORM_LAYER_LOC) -D swf=1 -D flash-use-stage -D advanced-telemetry -D no-compilation -D openfl-flash -D OPENFL_ENGINE -D hscriptPos -D verbose=1 -D web --macro "allowPackage('flash')" -swf-lib $(ASSET_LOC)/openflManifest/flash/debug/obj/assets.swf -swf-version 12 -cp $(ASSET_LOC)/openflManifest/flash/debug/haxe -dce full \
					-swf $(BIN_LOC)/$(BIN_NAME).swf $$assetVar $(ARGS) 2>&1`; \
					if [ $$? -ne 0 ]; then \
					echo Build errors:; \
					echo $$out; \
					echo $$out | grep --colour -E '/[A-Za-z0-9]*.hx:[0-9]*| : .*'; \
					aplay ../other/alert.wav; \
					exit 1; \
					fi

bwebgl:
	rsync -rhvu --delete $(ASSET_LOC) $(BIN_LOC)/webgl --exclude="*.mp3" --exclude="openflManifest" --delete-excluded
	# rm -rf $(BIN_LOC)/webgl/assets & cp -r $(ASSET_LOC) $(BIN_LOC)/webgl
	time haxe \
		-cp $(HAXELIB_LOC)/hscript \
		-cp $(HAXELIB_LOC)/hxinflate \
		-cp $(HAXELIB_LOC)/actuate \
		-cp $(HAXELIB_LOC)/hxmath \
		-cp $(HAXELIB_LOC)/mt \
		-cp $(HAXELIB_LOC)/format \
		-cp $(PLATFORM_LAYER_LOC) \
		-main Init -cp src -js $(BIN_LOC)/webgl/$(BIN_NAME).js \
		-D WEBGL_ENGINE -D hscriptPos -D stats $(ARGS)
	cp $(HTML_LIB_LOC)/* $(BIN_LOC)/webgl
	cp $(HTML_TEMPLATE_LOC) $(BIN_LOC)/webgl/index.html
	sed -i "s/GAME_JS_FILE/$(BIN_NAME)/g" $(BIN_LOC)/webgl/index.html
