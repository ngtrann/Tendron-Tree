private double fractionLength = 0.8; 
private int smallestBranch = 8; 
private double branchAngle = .4; 
Star[] stars = new Star[200];
public void setup()
{
  size(500, 400);
   for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  noLoop();
}

public void draw()
{
  background(219,238,255);
  stroke(255);
  strokeWeight(4);
  for (int i = 0; i < stars.length; i++) {
    stars[i].show();
  }
  stroke(80, 59, 49);
  strokeWeight(3);
  line(250, 400, 250, 300);
  drawBranches(250, 300, 80, 3*Math.PI/2);
}

public void drawBranches(int x, int y, double branchLength, double angle)
{
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength * fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1)+x);
  int endY1 = (int)(branchLength*Math.sin(angle1)+y);
  int endX2 = (int)(branchLength*Math.cos(angle2)+x);
  int endY2 = (int)(branchLength*Math.sin(angle2)+y);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  if (branchLength<=10)
    stroke(129, 31, 50);
  else if (branchLength<=20)
    stroke(234, 178, 178);
  else
    //stroke(80, 59, 49);
    stroke(113,90,95);
  if (branchLength > smallestBranch) {
    drawBranches(endX1, endY1, branchLength-fractionLength, angle1);
    drawBranches(endX2, endY2, branchLength-fractionLength, angle2);
  }
}
