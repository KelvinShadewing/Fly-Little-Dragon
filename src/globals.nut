/////////////////
// GLOBAL VARS //
/////////////////

::gvPlayers <- 0;
::gvQuit <- false;
::gvDebug <- true;
::gm <- 0;
::bgx <- [0, 0, 0, 0];
::gvScore0 <- 0;
::gvScore1 <- 0;
::gvDual <- 0;
::gvOverTimer <- 120;

//Character tables
//Predator legend: head, body, wings, bodytype

::config <- {
	safe = 0,
	difficulty = 0,
	con0 = {
		up = k_up,
		down = k_down,
		left = k_left,
		right = k_right
	},
	con1 = {
		up = k_w,
		down = k_s,
		left = k_a,
		right = k_d
	},
	prey0 = "Hida",
	prey1 = "Passy",
	pred = "Comito"
};

::strDifficulty <- ["Easy", "Normal", "Difficult"];
