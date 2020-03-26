package story;

class Calls
{
	public static function calls(seg:String):Void {
		clear();
		saveCheckpoint("Calls.calls('"+seg+"')");

		if (seg == "main") {
			append("You flip out the cell phone.");

			if (data.cagePhoneNumber) addChoice("Cage: 1-669-0077", calls.bind("Cage: 1-669-0077"), {faCensor: true});
			addChoice("1-800-COCK", calls.bind("1-800-COCK"), {faCensor: true});

			if (data.indigoPondNumber) addChoice("Indigo Pond: 1-694-2930", calls.bind("Indigo Pond: 1-694-2930"));
			if (data.roxPhoneNumber) addChoice("Roxelle: 1-694-2039", calls.bind("Roxelle: 1-694-2039"));
			if (data.thellyNumber) addChoice("Thelly: 1-693-2280", calls.bind("Thelly"));
			addChoice("867-5309", calls.bind("867-5309"));
			addChoice("666-6969", calls.bind("666-6969"));
			addChoice("1-800-BUTT", calls.bind("1-800-BUTT"));
			if (!data.calledFreddy) addChoice("1-900-490-FREAK", calls.bind("1-900-490-FREAK"), {cost: ["Capsule", 2]});
			for (mess in data.myntMessages)
				addChoice(mess, MyntScenes.recall.bind(mess));

			addChoice("Put the phone away.", startHub.bind(data.currentHub));
		}

		if (seg == "1-900-490-FREAK") {
			data.calledFreddy = true;
			unlockUi("freak", "all", false);
			equipUi("freak");
			playSound("assets/audio/music/freddy");
			append("\"It's the freak phone, and here's the party freak. Freddy Freaker, the dancin' new sensation, grabbin' the nation, doin' the freak. Call Now. 1-900-490-FREAK. Join the party, the fast and easy way, to hear what's scammin' from New York to L.A. Call now. 1-900-490-FREAK. What's happenin' what's jammin', party 'til you drop. Dial and hear the action, what's hot and what's not. Call Now. 1-900-490-FREAK. Two capsules a call.\"");
			addChoice("Back.", calls.bind("main"));
		}

		if (seg == "Thelly") {
			if (getPlace("Indigo Pond") == null) {
				append("\"Hey, did you find out where that mysterious secret pond is yet??\"");
				addChoice("Not yet no.", calls.bind("thellynope"));
			} else if (!data.thellyCallDone) {
				append("\"Hey, could you please um— please take your dick outta my butt, I got a call.\n\nOh hi "+data.playerName+"! Did you find directions?\"");
				addChoice("I did!!", calls.bind("thellycall"));
			} else {
				append("\"Hey, I'm away from my phone right now! Leave me a message at the boop.\"\n\n<!i>Boop.<!i>");
				addChoice("Back.", calls.bind("main"));
			}
		}

		if (seg == "thellynope") {
			append("\"Darn it... I really gotta ask him something...\"");
			addChoice("Back.", calls.bind("main"));
		}

		if (seg == "thellycall") {
			data.thellyCallDone = true;
			append("\"Where where where?\"");
			addChoice("Take a left at the cumming owl, follow the blue bushes...", calls.bind("thellycall2"));
		}

		if (seg == "thellycall2") {
			append("\"One sec— let me get a pen— sir, could you please write this on me? No, not my asscheeks... I have to be able to read it— what?! No, I'm not that flexible... okay, got it. Go on?\"");
			addChoice("Then if you smell booze, go north. If you smell nymph taint, go south.", calls.bind("thellycall3"));
		}

		if (seg == "thellycall3") {
			append("\"Ow... dude, don't push the marker down so hard... you're not my dom, Marei is...! Shut up! Sorry. Ow~! Sorry sorry sorry!! Okay. Okay, alright. I'll meet you at Indigo Pond!\"");
			addChoice("Gotcha!", calls.bind("main"));
		}

		if (seg == "Cage: 1-669-0077") {
			append("Ringing...\n\n");

			if (data.cagePhoned == 0){
				append("\"Fuck you want?\"");
				addChoice("Calm down. Jeez. Just wondering what you're up to.", calls.bind("jeez just wondering"));
			} else {
				append("It goes to voicemail:\n\n\"Not here. Leave your name at the scream.\"\n\nThere's a thud and a high-pitched cub shriek.");
				addChoice("Make some calls.", calls.bind("main"));
				addChoice("Put the phone away.", startHub.bind(data.currentHub));
			}
		}

		if (seg == "jeez just wondering") {
			append("\"I am calm. Just finished using my stress ball, as a matter of fact. Ain't that right, little slut?\"\n\nCage holds the speaker up to a cub's mouth and a few gurgly high-pitched whimpers come through your phone.\n\n\"He's doing great.\"");

			addChoice("Give his face a good stomp for me~", calls.bind("good stomp"));
			addChoice("Put him on.", calls.bind("put him on"));
		}

		if (seg == "good stomp") {
			data.cageFaceStomp = true;
			append("\"Hear that? "+pickByGender("He wants", "She wants", "They want")+" me to break your face. What do <!i>you<!i> want?\"\n\nCage puts him on the line.\n\n\"... that...\"\n\n\"Be specific.\"\n\n\"I wanna get my face s-stomped in...\"\n\n\"A little more specific.\"\n\n\"Please... please...\"\n\n\"You can do it.\"\n\n\"... My mouth... stomp my mouth... and my nose... break em. Make me p-pretty~!\"\n\nWith a click Cage sets the phone down next to the cub's head.\n\n\"Ready honey? Eyes on me. That's it. Keep your mouth open.\"");

			addChoice("Next.", calls.bind("cagephone1next"));
		}

		if (seg == "cagephone1next") {
			append("A crack-thud and a high, wet, girly squeal. One more of each a little louder. \"Open,\" Cage says in the background. \"Wider. Come on... your jaw's not <!i>that<!i> broken.\"\n\nWith clear effort the stress ball gives a tiny, gurgling squeak: \"Mo~! One mo!\"\n\n\"Well, it won't be on your mouth if you can't open it... are you sure that's okay?\"\n\n\"Mhm! Pleath! Pleath! Mo!\"\n\n\"Eyes on me.\"");

			addChoice("Wait. Put him on.", calls.bind("put him on"));
			addChoice("Next.", calls.bind("cagephone1next2"));
		}

		if (seg == "cagephone1next2") {
			append("Thud.");
			addChoice("...", calls.bind("cagephone1next3"));
		}

		if (seg == "cagephone1next3") {
			append("\"You still there?\"");
			addChoice("Mhm.", calls.bind("mhm"));
		}

		if (seg == "mhm") {
			data.cagePhoned++;
			append("\"Nice. Thought that might've been a bit much for ya. Anyway, I gotta fuck off for a bit. Promised I'd meet up with an old friend from the meteorite. I'd tell this little cutie to say bye-bye, but his forehead's sorta concave...\"");

			addChoice("Nice talking to you!", calls.bind("nice talking"));
			addChoice("Seeya.", calls.bind("main"));
		}

		if (seg == "put him on") {
			if (!data.cageFaceStomp) append("\"H... Hello~!\" the little voice manages, still sounding husky, as if something's clogging his throat.");
			else append("\"H... Hello~!\" the little voice manages through an obviously broken mouth, panting and whimpering pathetically into the phone.");

			addChoice("What are you wearing, babe?", calls.bind("what wearing"));
		}

		if (seg == "what wearing") {
			append("\"Mmnn... just pannies... but they're falling off. Cage just raped me right through em, now they're all ripped... hn— AH~! Please, I'm trying to—!\"");

			addChoice("What's happening?", calls.bind("whats happening"));
		}

		if (seg == "whats happening") {
			data.cagePhoned++;
			append("He can't do much but staccato squeak desperately, voice warm and melty through the speaker. \"Puh— Punchfuck! Punchfuck me~!\"\n\nCage in the background: \"My buddy asked you what's happening. Tell him.\"\n\nThe stress ball takes a second to catch his breath, then explains through occasional squeals: \"Headlock... he's got me in a headlock... punching my insiiiIIIIDES... hahhh... mrrf! I'm fat... my tummy is bulging...\"\n\nCage comes back on. \"Call me later. I'm gonna need some one-on-one time with this little fuckrag.\"");

			addChoice("Nice talking to you!", calls.bind("nice talking"));
			addChoice("Seeya.", calls.bind("main"));
		}

		if (seg == "nice talking") {
			append("He seems like he's about to say \"Nice talking to you too!\" but then he just grunts acknowledgement and hangs up.");
			addChoice("Make some calls.", calls.bind("main"));
			addChoice("Put the phone away.", startHub.bind(data.currentHub));
		}

		if (seg == "1-800-COCK") {
			append("A husky automated recording begins.\n\n\"Mnnnrgh~! You've reached the help line for Hyper Land~! Hnnya~! Looks like none of our operators can come to the phone right now~! MRRRRRRRRRRRRRRRRRRRRRRRRRFFFFFFFFGHGHGHHGHGHGH~~~!!!!\n\nPress 1 for visitor information, 2 for complaints, and 3 to hear our Deal of the Week!\"");

			addChoice("1.", calls.bind("cock1"));
			addChoice("2.", calls.bind("cock2"));
			addChoice("3.", calls.bind("cock3"));
			addChoice("Make some calls.", calls.bind("main"));
			addChoice("Put the phone away.", startHub.bind(data.currentHub));
		}

		if (seg == "cock1") {
			append("Boop.\n\nVisitor Information\n\n\"Thank you for inquiring about Hyper Land! Hyper Land was founded at the end of Year 26 by Patch, our foxy little entrepreneur!\n\nHyper Land was shut down for renovations just in Year 60... but this week is our grand re-opening in a new inflatable building up on Violet Meteorite! Go check it the fuck out, mkay~?\"");

			addChoice("2.", calls.bind("cock2"));
			addChoice("3.", calls.bind("cock3"));
			addChoice("Make some calls.", calls.bind("main"));
			addChoice("Put the phone away.", startHub.bind(data.currentHub));
		}

		if (seg == "cock2") {
			append("Beep.\n\nComplaints\n\n\"Go fuck yourself, mkay~?\"");

			addChoice("1.", calls.bind("cock1"));
			addChoice("3.", calls.bind("cock3"));
			addChoice("Make some calls.", calls.bind("main"));
			addChoice("Put the phone away.", startHub.bind(data.currentHub));
		}

		if (seg == "cock3") {
			data.hyperLandFreePass = true;
			append("Boooop.\n\nDeal of the Week!\n\n\"Our Deal of the Week is a super important one this time around, since we have a NEW PLAYER!! All you have to do is mention this special code word to your ticket booth operator: "+data.playerName.toUpperCase()+". If you do that, you'll get a FREEEeee season pass, mkay~?!\"");

			addChoice("1.", calls.bind("cock1"));
			addChoice("2.", calls.bind("cock2"));
			addChoice("Make some calls.", calls.bind("main"));
			addChoice("Put the phone away.", startHub.bind(data.currentHub));
		}

		if (seg == "Indigo Pond: 1-694-2930") {
			if (!data.indigoPondPhoned) {
				append("Ringing... ringing... still ringing...");
				addChoice("Next.", calls.bind("indigophonenext1"));
			} else {
				append("Ringing... ringing...\n\n... still ringing...\n\nYou think they're busy.");
				addChoice("Make some calls.", calls.bind("main"));
				addChoice("Put the phone away.", startHub.bind(data.currentHub));
			}
		}

		if (seg == "indigophonenext1") {
			append("\"Hi, I'm just the bartender. Allei can't come to the phone right now cause she's piss drunk.\"");
			addChoice("Yes, hello, um. Long story short, a nymph gave me this card.", calls.bind("nymph card"));
		}

		if (seg == "nymph card") {
			append("\"Oh, she <!i>gave<!i> it to you, did she? That does sound like Allei.\"");

			addChoice("She did have the courtesy to knock me out first, I guess.", calls.bind("she gave alright"));
			addChoice("Oh she gave it to me alright.", calls.bind("she gave alright"));
		}

		if (seg == "she gave alright") {
			append("\"Hah. Well, tell you what... this place, Indigo Pond, it's a nymphs-only kind of thing. But—\" a girl slurs in the background, complaining \"—YOU CAN WAIT TIL I'M OFF THE PHONE FOR YOUR FIFTH ROUND OF SHOTS, YOU DRUNK WHORE. Sorry. Yeah, it's nymphs-only, but who cares.\n\nWe've got an otter who always floats in here no matter how many times we drain the pond and move it somewhere else. He just kind of shows up. And there's a bull that none of us have even tried to keep out. He likes the little ones. Anyway...\"");

			addChoice("Where is it?", calls.bind("where is it"));
		}

		if (seg == "where is it") {
			data.indigoPondPhoned = true;
			append("\"Take a left at the owl who's always cumming in the trees, then follow the blue-ish bushes for a bit, then, if you smell booze, go north. If you smell sweaty nymph taint, go south. You'll find it.\"\n\nThe girl is throwing a tantrum in the background. The bartender sighs heavily into the phone. \"I gotta go. See you soon!\"");

			addPlace("Indigo Pond", "A nymphs-only relaxation spot tucked deep inside an illusive thicket.", "Bright Forest");

			addChoice("Take a left at the owl, follow the bushes, sniff around, gotcha.", IndigoPond.indigoPond.bind("main"));
			addChoice("Make some calls.", calls.bind("main"));
			addChoice("Put the phone away.", startHub.bind(data.currentHub));
		}

		if (seg == "Roxelle: 1-694-2039") {
			append("It goes straight to voicemail.\n\n\"Hiya it's the fat cow down at the farm with the boys. Fuck talkin over the phone just come down, she's not far out and the horses are lonely.\"");

			addChoice("Make some calls.", calls.bind("main"));
			addChoice("Put the phone away.", startHub.bind(data.currentHub));
		}

		if (seg == "867-5309") {
			append("It goes to Jenny's voicemail.\n\n\"STOP FUCKING CALLING ME ITS NOT FUNNY!\"");
			addChoice("Make some calls.", calls.bind("main"));
			addChoice("Put the phone away.", startHub.bind(data.currentHub));
		}

		if (seg == "666-6969") {
			append("It's just a recording of wet, slurpy noises while death metal pounds away in the background.\n\nWeird.");
			addChoice("Make some calls.", calls.bind("main"));
			addChoice("Put the phone away.", startHub.bind(data.currentHub));
		}

		if (seg == "1-800-BUTT") {
			append("\"We're sorry, your call cannot be completed as dialed.\"\n\nYou are extremely disappointed.");
			addChoice("Make some calls.", calls.bind("main"));
			addChoice("Put the phone away.", startHub.bind(data.currentHub));
		}
	}
}
