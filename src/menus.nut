///////////
// MENUS //
///////////

::menu <- [];
::cursor <- 0;
::textMenu <- function(){
  //If no menu is loaded
  if(menu == []) return;

	//Draw options
	for(local i = 0; i < menu.len(); i++){
		if(cursor == i) drawText(fnt0, 200 - (menu[i][0].len() * 6), 238 - (menu.len() * 14) + (i * 14), "=> " + menu[i][0] + " <=");
		else drawText(fnt0, 200 -(menu[i][0] * 6), 238 - (menu.len() * 14) + (i * 14), menu[i][0]);
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

	if(keyPress(k_space) || keyPress(k_return)){
		menu[cursor][1]();
	};
};

::meMain <- [
	["Singleplayer", function(){ gvPlayers = 1; gvDual = 0; gm = gmPlay; }],
	["Multiplayer", function(){ gvPlayers = 2; gvDual = 0; gm = gmPlay; }],
  ["Dual Stick", function(){ gvPlayers = 2, gvDual = 1; gm = gmPlay; }],
	["Options", function(){ cursor = 0; menu = meOptions; }],
	["Quit", function(){ gvQuit = 1; }]
];

::meOptions <- [
  ["Difficulty: " + strDifficulty[config.difficulty], function(){ menu = meDifficulty; }],
  ["Prey 1: " + gvPrey0, function(){} ],
  ["Prey 1: " + gvPrey1, function(){} ]
];

::meDifficulty <- [
  ["Easy", function(){ config.difficulty = 0; cursor = 0; menu = meOptions; }],
  ["Normal", function(){ config.difficulttty = 1; cursor = 0;     menu = meOptions; }],
  ["Hard", function(){ config.difficulty = 2; cursor = 0; menu = meOptions; }]
];
