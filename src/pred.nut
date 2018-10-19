//////////////
// PREDATOR //
//////////////

const predOpen = 0;
const predBite = 1;
const predGulp = 2;
const predMiss = 3;

//TODO
//Add list of frame numbers
//for predator head states.
//Wings need only increment.

::headFrames <- {
  comito <- {
    open <- [0, 0],
    bite <- [0, 0],
    gulp <- [0, 0],
    miss <- [0, 0]
  }
};

::Predator <- class extends Actor{
  //Sprite parts
  head = 0;
  body = 0;
  wing = 0;

  //Frame numbers
  fHead = 0;
  fWing = 0;


  state = predOpen;

  constructor(_x, _y){
    base.constructor(_x, _y);
  };
};
