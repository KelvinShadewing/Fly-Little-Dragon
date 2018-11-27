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
<<<<<<< HEAD
		if(cursor == i) drawText(fnt0, 200 - (menu[i][0].len() * 6), 238 - (menu.len() * 14) + (i * 14), "=> " + menu[i][0] + " <=");
		else drawText(fnt0, 200 -(menu[i][0] * 6), 238 - (menu.len() * 14) + (i * 14), menu[i][0]);
=======
		if(cursor == i) drawText(font, 200 - ((menu[i].name().len() + 4) * 6), 238 - (menu.len() * 14) + (i * 14), "=>" + menu[i].name() + "<=");
		else drawText(font, 200 -(menu[i].name().len() * 6), 238 - (menu.len() * 14) + (i * 14), menu[i].name());
>>>>>>> d28052ddad2f42ce23ba599e81ac7adc6aa4f1d1
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
		menu[cursor].func();
	};
};

/*::meMain <- [
	["Singleplayer", function(){ gvPlayers = 1; gvDual = 0; gm = gmPlay; }],
	["Multiplayer", function(){ gvPlayers = 2; gvDual = 0; gm = gmPlay; }],
  ["Dual Stick", function(){ gvPlayers = 2, gvDual = 1; gm = gmPlay; }],
	["Options", function(){ cursor = 0; menu = meOptions; }],
	["Quit", function(){ gvQuit = 1; }]
];*/

//Names are stored as functions because some need to change each time
//they're brought up again.
::meMain <- [
	{
		name = function(){ return "Singleplayer"; },
		func = function(){ gvPlayers = 1; gvDual = 0; gm = gmPlay; }
	},
	{
		name = function(){ return "Multiplayer"; },
		func = function(){ gvPlayers = 2; gvDual = 0; gm = gmPlay; }
	},
	{
		name = function(){ return "Dual Stick"; },
		func = function(){ gvPlayers = 2, gvDual = 1; gm = gmPlay; }
	},
	{
		name = function(){ return "Options"; },
		func = function(){ cursor = 0; menu = meOptions; }
	},
	{
		name = function(){ return "Quit"; },
		func = function(){ gvQuit = 1; }
	}
];

::meOptions <- [
  {
		name = function(){ return "Difficulty: " + strDifficulty[config.difficulty]; },
		func = function(){ cursor = 0; menu = meDifficulty; }
	},
  {
		name = function(){ return "Prey 1: " + gvPrey0; },
		func = function(){}
	},
  {
		name = function(){ return "Prey 2: " + gvPrey1; },
		func = function(){}
	},
	{
		name = function(){ return "Back"; },
		func = function(){ cursor = 0; menu = meMain; }
	}
];

::meDifficulty <- [
<<<<<<< HEAD
  ["Easy", function(){ config.difficulty = 0; cursor = 0; menu = meOptions; }],
  ["Normal", function(){ config.difficulttty = 1; cursor = 0;     menu = meOptions; }],
  ["Hard", function(){ config.difficulty = 2; cursor = 0; menu = meOptions; }]
=======
  {
		name = function(){ return "Easy"; },
		func = function(){ config.difficulty = 0; cursor = 0; menu = meOptions; }
	},
  {
		name = function(){ return "Normal"; },
		func = function(){ config.difficulty = 1; cursor = 0; menu = meOptions; }
	},
  {
		name = function(){ return "Hard"; },
		func = function(){ config.difficulty = 2; cursor = 0; menu = meOptions; }
	}
>>>>>>> d28052ddad2f42ce23ba599e81ac7adc6aa4f1d1
];
