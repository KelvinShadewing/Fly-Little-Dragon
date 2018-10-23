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

  xspeed = 0;
  yspeed = 0;

  state = predOpen;

  constructor(_x, _y){
    base.constructor(_x, _y);
  };

  function step(){
    base.step();

    //Movement and bounds
    x += xspeed;
    y += yspeed;
    if(y > 240){
      y = 240;
      yspeed = 0;
    };
    if(y < 0){
      y = 0;
      yspeed = 0;
    };

    //Find target
    local target = 0;
    foreach(i in actor){
      if(typeof i == "Prey"){ //See if any players exist
        if(target == 0){ //If a target was not already found
          target = i.id;
        } else {
          if(i.x < actor[target].x){ //If the other player is closer
            target = i.id; //Change target to closer player
          };
        };
      };
    };

    //If no player was found, search for birds
    if(target == 0) foreach(i in actor){
      if(typeof i == "Bird"){
        target = i.id;
      };
    };

  }; //End step()

}; //End Predator
