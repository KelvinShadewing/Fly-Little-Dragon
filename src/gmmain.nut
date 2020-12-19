::gmMain <- function(){
	drawSprite(bgTitle, 0, 0, 0);
	textMenu();
	if(keyPress(k_escape)) gvQuit = true;
};
