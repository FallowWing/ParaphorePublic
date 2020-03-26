package;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;
import haxe.macro.Format;

using StringTools;
using Lambda;

class Macros
{
	macro public static function buildDate():ExprOf<Date> {
		var date = Date.now();
		var year = toExpr(date.getFullYear());
		var month = toExpr(date.getMonth());
		var day = toExpr(date.getDate());
		var hours = toExpr(date.getHours());
		var mins = toExpr(date.getMinutes());
		var secs = toExpr(date.getSeconds());
		return macro new Date($year, $month, $day, $hours, $mins, $secs);
	}

	macro public static function buildGitCommitSha():ExprOf<String> {
		var proc = new sys.io.Process('git', ['log', "--pretty=format:'%h'", '-n', '1']);
		var sha1 = proc.stdout.readLine();
		return toExpr(sha1);
	}

	macro public static function buildDateString():ExprOf<String> {
		return toExpr(Date.now().toString());
	}

	macro public static function buildAssetNames(directory:String):Array<Field> {
		var fileReferences:Array<String> = [];
		var fields:Array<Field> = Context.getBuildFields();

		for (fileRef in recurseDir(directory)) {
			// create new fields based on file references!
			fields.push({
				name: fileRef,
				access: [Access.APublic, Access.AStatic, Access.AInline],
				kind: FieldType.FVar(macro:String, macro $v{fileRef}),
				pos: Context.currentPos()
			});
		}

		return fields;
	}

#if macro
	static function recurseDir(dir:String):Array<String> {
		dir = haxe.io.Path.addTrailingSlash(dir);
		var filePaths:Array<String> = [];
		var fileNames:Array<String> = sys.FileSystem.readDirectory(dir);

		for (fileName in fileNames) {
			var filePath:String = dir+fileName;
			if (!sys.FileSystem.isDirectory(filePath)) {
				filePaths.push(filePath.substring(3, filePath.length));
			} else {
				for (path in recurseDir(filePath)) filePaths.push(path);
			}
		}

		return filePaths;
	}

	static function toExpr(v:Dynamic) {
		return Context.makeExpr(v, Context.currentPos());
	}
#end
}

#if !macro
@:build(Macros.buildAssetNames("../assets/"))
class AssetNames {}
#end
