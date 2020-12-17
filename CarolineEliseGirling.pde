


//This is the screen size parameters
void setup() {
  size(640, 480);
}
//angle speed causes movement in C and G
float angle_c = 0;
float angle_speed_c = +.01;
float angle2_g = 0;
float angle_speed2_g = +.01;
//Correspond to e
int y_ofE = 200;
int x = 300;
int dx  = 1;
//20 because this is the size of the ball/ellipse prevents overlapping, causes it to go down everyother
int dy = 20;
float straight_xline_of_g = 500;
float straight_yline_of_g = 400;
float straight_x_lineofg_speed = 1;
//This is where my E code starts
void draw() {
  //This makes the code stop drawing at the top of the E
  if (y_ofE < 300) {
    ellipse(x, y_ofE, 20, 20);
    stroke(175, 100, 220);
    fill(7, 112, 162);
    x = x + dx;
    // These are the parameters for when the ellipse draws the prongs of the E
    //34-38 cause it to bounce in either direction depending on the value 
    if (x > 400) {
      dx = -1;
    }

    if (x < 300) {
      dx = 1;
    }

//This causes the E to move down and to the right to create more prongs until the parameters stop it
//If it hits exactly 300 on the left the ellipse moves down to create another prong
    if (x == 300) {
      y_ofE = y_ofE + dy;
    }
  }
 //Ths is where my G code for straight line of G starts
ellipse( straight_xline_of_g,straight_yline_of_g,10,20);
//Below causes the straight part of g to move
straight_xline_of_g += straight_x_lineofg_speed;
//causes a bounce
if (straight_xline_of_g < 500 || straight_xline_of_g > 550){
  straight_x_lineofg_speed = -1* straight_x_lineofg_speed;
}

//Reverses direction for C and stops it
  if (angle_c > 1.1*PI || angle_c < 0) {
    angle_speed_c *= -1;
  }
  //Code for C
  angle_c += angle_speed_c;
  translate(100, 125);
  rotate(angle_c);
  ellipse(10, 50, 10, 50);
  // The rotate and translate are listed twice because I have the same code twice and without slight differences it results in an error breaking my code
  rotate(-1*angle_c);
  translate(-100, 125);


  if (angle2_g > 1.1*PI || angle2_g < 0) {
    angle_speed2_g *= -1;
  }
  //Code for curvy part of G
  angle2_g += angle_speed2_g;
  translate(500, 150);
  rotate(angle2_g);
  ellipse(10, 50, 10, 30);
//I made the width between the two identical blocks of code slightly different because a G should be skinnier then a C
}
