::bg <- [0, 0, 0, 0];

::drawBackground <- function(){
	//Draw the layers
	for(local i = 0; i < 4; i++){ // 0
		drawSprite(bg0, 0, bgx[0] + (160 * i), 0);
	};

	for(local i = 0; i < 6; i++){ // 1
		drawSprite(bg1, 0, bgx[1] + (95 * i), 180);
	};

	for(local i = 0; i < 5; i++){ // 2
		drawSprite(bg2, 0, bgx[2] + (144 * i), 192);
	};

	for(local i = 0; i < 8; i++){ // 3
		drawSprite(bg3, 0, bgx[3] + (64 * i), 208);
	};

	//Shift coords
	for(local i = 0; i < 4; i++){
		bgx[i] -= 1 + (i * 2);
	};

	//Reset coords
	if(bgx[0] < -160) bgx[0] += 160;
	if(bgx[1] < -95) bgx[1] += 95;
	if(bgx[2] < -144) bgx[2] += 144;
	if(bgx[3] < -64) bgx[3] += 64;
};
