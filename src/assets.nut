///////////////
// RESOURCES //
///////////////

//Audio
::music <- loadMusic("res/music.mp3");
print("Loaded music.");
::sndAlarm <- loadSound("res/sndAlarm.wav");
print("Loaded sndAlarm.");
::sndBird <- loadSound("res/sndBird.wav");
print("Loaded sndBird.");
::sndBite <- loadSound("res/sndBite.wav");
print("Loaded sndBite.");
::sndConfirm <- loadSound("res/sndConfirm.wav");
print("Loaded sndConfirm.");
::sndDie <- loadSound("res/sndDie.wav");
print("Loaded sndDie.");
::sndGulp <- loadSound("res/sndGulp.wav");
print("Loaded sndGulp.");

//Sprites
//newSprite( file, width, height, margin, padding, pivotX, pivotY, frames );

::sprFont <- newSprite("res/sprFont.png", 12, 14, 0, 0, 0, 0, 0);
::font <- newFont(sprFont, 33, 0, 0, -4);
::sprFont2 <- newSprite("res/sprFont2.png", 12, 14, 0, 0, 0, 0, 0);
::font2 <- newFont(sprFont2, 33, 0, 0, -4);
::sprCereal <- newSprite("res/rings.png", 16, 16, 1, 1, 8, 8, 0);

::sprPrey <- {
	"Hida" : {
		fly = newSprite("res/HidaFly.png", 63, 31, 1, 1, 32, 20, 0),
		lose = newSprite("res/HidaLose.png", 38, 44, 1, 1, 19, 44, 0)
	},
	"Passy" : {
		fly = newSprite("res/PassyFly.png", 63, 31, 1, 1, 32, 20, 0),
		lose = newSprite("res/PassyLose.png", 38, 44, 1, 1, 19, 44, 0)
	}
};

::sprPred <- {
	"Comito" : {
		head = newSprite("res/ComitoHead.png", 128, 72, 0, 0, 96, 40, 0),
		body = newSprite("res/ComitoBody.png", 304, 96, 0, 0, 358, 38, 0),
		wing = 0,
		anim = {
			idle = [0, 1],
			bite = [2, 7],
			miss = [8, 13],
			gulp = [14, 23]
		}
	}
};

//Background
::bg0 <- newSprite("res/background0.png", 160, 240, 0, 0, 0, 0, 0);
::bg1 <- newSprite("res/background1.png", 95, 48, 0, 0, 0, 0, 0);
::bg2 <- newSprite("res/background2.png", 144, 72, 0, 0, 0, 0, 0);
::bg3 <- newSprite("res/background3.png", 64, 96, 0, 0, 0, 0, 0);
::bgTitle <- newSprite("res/titlebg.png", 400, 240, 0, 0, 0, 0, 0);
