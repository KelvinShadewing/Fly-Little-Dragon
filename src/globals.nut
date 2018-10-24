/////////////////
// GLOBAL VARS //
/////////////////

::gvPlayers <- 0;
::gvQuit <- false;
::gvDebug <- true;
::gvPredator <- "Comito";
::gvPrey0 <- "Hida";
::gvPrey1 <- "Passy";
::gm <- 0;
::bgx <- [0, 0, 0, 0];
::gvScore0 <- 0;
::gvScore1 <- 0;
::gvSafe <- 0;

//Character tables
//Predator legend: head, body, wings, bodytype
::tbPred <- {
	"Comito" : [["ComitoHead.png", w, h, 0, 0, 0, 0, 0], ["ComitoBody.png", w, h, 0, 0, 0, 0, 0], ["ComitoWings.png", w, h, 0, 0, 0, 0, 0], "Gryphon"]
};
