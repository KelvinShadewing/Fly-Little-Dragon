///////////////
// RESOURCES //
///////////////

//Audio
::music <- loadMusic("res/music.mp3");
::sndAlarm <- loadSound("res/sndAlarm.wav");
::sndBird <- loadSound("res/sndBird.wav");
::sndBite <- loadSound("res/sndBite.wav");
::sndConfirm <- loadSound("res/sndConfirm.wav");
::sndDie <- loadSound("res/sndDie.wav");
::sndGulp <- loadSound("res/sndGulp.wav");

//Sprites
//Characters are reloaded separately when switched
::sprPredHead;
::sprPredBody;
::sprPredWing;

//Background
::bg0 <- newSprite("res/background0.png", 160, 240, 0, 0, 0, 0, 0);
::bg1 <- newSprite("res/background1.png", 95, 48, 0, 0, 0, 0, 0);
::bg2 <- newSprite("res/background2.png", 144, 72, 0, 0, 0, 0, 0);
::bg3 <- newSprite("res/background3.png", 64, 96, 0, 0, 0, 0, 0);
::bgTitle <- newSprite("res/titlebg.png", 400, 240, 0, 0, 0, 0, 0);