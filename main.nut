/*===================*\
| FLY, LITTLE DRAGON! |
\*===================*/

///////////////
// RESOURCES //
///////////////

//Audio
local music = loadMusic("res/music.mp3");
local sndAlarm = loadSound("res/sndAlarm.wav");
local sndBird = loadSound("res/sndBird.wav");
local sndBite = loadSound("res/sndBite.wav");
local sndConfirm = loadSound("res/sndConfirm.wav");
local sndDie = loadSound("res/sndDie.wav");
local sndGulp = loadSound("res/sndGulp.wav");

//Sprites
local sprHidaFly = newSprite("res/HidaFly.png", 63, 31, 1, 1, 32, 16, 3);
local sprPassyFly = newSprite("res/PassyFly.png", 63, 31, 1, 1, 32, 16, 3);

//Background
local bg0 = newSprite("res/background0.png", 160, 240, 0, 0, 0, 0, 0);
local bg1 = newSprite("res/background1.png", 95, 48, 0, 0, 0, 0, 0);
local bg2 = newSprite("res/background2.png", 144, 72, 0, 0, 0, 0, 0);
local bg3 = newSprite("res/background3.png", 64, 96, 0, 0, 0, 0, 0);


////////////
// ACTORS //
////////////

local actorList = [];
function deleteActor( actor ){
	for(local i = 0; i < actorList.len(); i++){
		if(actorList[i] == actor){
			actorList.remove(i);
			return;
		};
	};
};

class Actor{
	constructor(){
		actorList.push(this);
	};
};



////////////////
// GAME MODES //
////////////////

local gm;


////////////////////
// MISC FUNCTIONS //
////////////////////

local bgx = [0, 0, 0, 0];

function drawBackground(){
	//Draw the layers
	for(local i = 0; i < 3; i++){ // 0
		drawSprite(bg0, 0, bgx[0] + (160 * i), -48);
	};
	
	for(local i = 0; i < 5; i++){ // 1
		drawSprite(bg1, 0, bgx[1] + (95 * i), 164);
	};
	
	for(local i = 0; i < 4; i++){ // 2
		drawSprite(bg2, 0, bgx[2] + (144 * i), 172);
	};
	
	for(local i = 0; i < 6; i++){ // 3
		drawSprite(bg3, 0, bgx[3] + (64 * i), 196);
	};
	
	//Shift coords
	for(local i = 0; i < 4; i++){
		bgx[i] -= 1 + i;
	};
	
	//Reset coords
	if(bgx[0] < -160) bgx[0] += 160;
	if(bgx[1] < -95) bgx[1] += 95;
	if(bgx[2] < -144) bgx[2] += 144;
	if(bgx[3] < -64) bgx[3] += 64;
};


 /////////////////////
///////////////////////
//// MAIN FUNCTION ////
///////////////////////
 /////////////////////

function main(){
	//Set up the window
	setFPS(60);
	setResolution(320, 240);
	setWindowTitle("Fly, Little Dragon!");
	
	//Start the music
	playMusic(music, -1);
	
	//Main game loop
	while(true){
		drawBackground();
		if(keyPress(k_escape) || getQuit()) break;
		update();
	};
};

main();