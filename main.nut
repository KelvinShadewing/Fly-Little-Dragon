/*===================*\
| FLY, LITTLE DRAGON! |
\*===================*/

///////////////
// RESOURCES //
///////////////

local font = openFont("res/bobsgame.ttf", 8);

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

//Predators are reloaded separately when switched

//Background
local bg0 = newSprite("res/background0.png", 160, 240, 0, 0, 0, 0, 0);
local bg1 = newSprite("res/background1.png", 95, 48, 0, 0, 0, 0, 0);
local bg2 = newSprite("res/background2.png", 144, 72, 0, 0, 0, 0, 0);
local bg3 = newSprite("res/background3.png", 64, 96, 0, 0, 0, 0, 0);
local bgTitle = newSprite("res/titlebg.png", 400, 240, 0, 0, 0, 0, 0);



/////////////////
// GLOBAL VARS //
/////////////////

local gvPlayers = 0;
local gvQuit = false;
local gvDebug = true;
local gvPredator = "Comito";
local gvPrey0 = "Hida";
local gvPrey1 = "Passy";

//Predator tables
//Data legend: head, body, wings, bodytype, blocked

local tbPreds = {
	"Comito" : ["ComitoHead.png", "ComitoBody.png", "ComitoWings.png", "Gryphon", false]
};



////////////
// ACTORS //
////////////

local actor = [];

function deleteActor( index ){
	actor[index] = 0;
};

function newActor( type, x, y ){
/*
	//If the list is empty
	if(actor.len() == 0){
		actor.push(type(x, y));
		return 0;
	};
	
	//Check for an open spot
	for(local i = 0; i < actor.len(); i++){
		if(actor[i] == 0){
			actor[i] = type(x, y);
			return i;
		};
	};
*/
	
	//Add new spot
	actor.push(new type(x, y));
	return actor.len() - 1;
};

function runActors(){
	for(local i = 0; i < actor.len(); i++){
		if(actor[i] != 0) actor[i].step();
	};
};


//Actor classes
class Actor{
	x = 0;
	y = 0;
	
	constructor(_x, _y){
		x = _x;
		y = _y;
	};
	
	function step(){
	};
};

class Predator extends Actor{
	constructor(_x, _y){
		base.constructor(_x, _y);
		
		//TO DO
		//Assign sprites based on gvPredator
		
		//Set animation type based on predator body type
	};
};




////////////////
// GAME MODES //
////////////////

local gm;

function gmMain(){
	drawSprite(bgTitle, 0, 0, 0);
	textMenu();
};

function gmPause(){
};

function gmOver(){
};

function gmPlay(){
};



///////////
// MENUS //
///////////

local menu = [];
local cursor = 0;

function textMenu(){
	//Draw options
	for(local i = 0; i < menu.len(); i++){
		if(cursor == i) drawText(200, 238 - (menu.len() * 9) + (i * 9), "=> " + menu[i][0] + " <=", font, 0xF8F8F8, ha_center, va_bottom);
		else drawText(200, 238 - (menu.len() * 9) + (i * 9), menu[i][0], font, 0xF8F8F8, ha_center, va_bottom);
	};
	
	//Keyboard input
	if(keyPress(k_down)){
		cursor++;
		if(cursor >= menu.len()) cursor = 0;
	};
	
	if(keyPress(k_up)){
		cursor--;
		if(cursor < 0) cursor = menu.len() - 1;
	};
	
	if(keyPress(k_space) || keyPress(k_enter)){
		menu[cursor][1]();
	};
};

local meMain = [
	["Singleplayer", function(){ gvPlayers = 1; gm = gmPlay; }],
	["Multiplayer", function(){ gvPlayers = 2; gm = gmPlay; }],
	["Options", function(){ gvPlayers = 1; gm = gmPlay(); }],
	["Quit", function(){ gvQuit = 1; }]
];



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

function drawDebug(){
	drawText(8, 8, getFPS().tostring(), font, 0xf8f8f8, 0, 0);
};


 /////////////////////
///////////////////////
//// MAIN FUNCTION ////
///////////////////////
 /////////////////////

function main(){
	//Set up the window
	setFPS(30);
	setResolution(400, 240);
	setWindowTitle("Fly, Little Dragon!");
	gm = gmMain;
	menu = meMain;
	
	//Start the music
	playMusic(music, -1);
	
	//Main game loop
	while(!gvQuit){
		if(keyPress(k_escape) || getQuit()) break;
		
		gm();
		drawDebug();
		
		update();
	};
};

main();