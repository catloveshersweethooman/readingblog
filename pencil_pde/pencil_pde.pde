PImage brushPic, backwardPic, forwardPic;
float r, brushDist, r1, r2, logarithmic, alpha, brushsize_change, brushalpha_change, brushcolor;
float lastX, lastY, newX, newY;
long startTime, newTime;

void setup() {
  //画布参数
  size(1000,1000);
  background(255);
  
  //笔刷参数
  r = 1.8;
  alpha = 100;
  brushsize_change = 1;
  //brushalpha_change = 0.2;
  
  brushPic=loadImage("brush.png");
  
}

void draw() {
}

void mousePressed() {
  save("backwardPic.png");
  brushDist = 0.2;
  if (lastX == 0 && lastY == 0) {
    lastX = mouseX;
    lastY = mouseY;
    startTime = System.currentTimeMillis();
  }
}

void mouseDragged() {

  imageMode(CENTER);
  int brushNum;
  float dist = dist(mouseX, mouseY, lastX, lastY);
  float angle = atan2(mouseY - lastY, mouseX - lastX);

  if (dist > brushDist) {
    newTime = System.currentTimeMillis();
    float velocity = dist/abs(newTime - startTime);
    startTime = newTime;
    float d_brushsize = brushsize_change * velocity;
    //float d_brushalpha = brushalpha_change * velocity;
    brushNum = int(dist/brushDist);
    float newX = 0;
    float newY = 0;
    for (int i = 1; i <= brushNum; i++) {
      float l = i * brushDist;
      newX = lastX + cos(angle) * l;
      newY = lastY + sin(angle) * l;
      tint(brushcolor, alpha);
      r1 = r*(1- d_brushsize);
      pushMatrix();
      translate(newX, newY);
      //ellipse(0,0,r1*2,r1*2);
      rotate(angle + PI/2+random(-2, 2));//旋转笔刷
      image(brushPic, 0, 0, r1* 2, r1* 2 );//笔刷
      tint(brushcolor, alpha/5);
      logarithmic = 0.38;//晕墨半径大小
      r2 = r1 * exp(logarithmic);
      //ellipse(0,0,r2*2,r2*2);
      image(brushPic, 0, 0, r2 * 2, r2 * 2 );//晕墨
      popMatrix();
    }
    lastX = newX;
    lastY = newY;
  }
}

void mouseReleased() {
  lastX = 0;
  lastY = 0;
  save("forwardPic.png");
}

void keyPressed() {
  if (key =='s'||key=='s') {//变细
    if (r>1.6) {
      r -= 1;
    } else if (r>0.6) {
      r -=0.3;
    } else {
      r = 1.6;
    }
  }
  if (key =='b'||key=='B') {//加粗
    r += 1;
  }
  if (key =='z'||key=='Z') {//撤回
    backwardPic = loadImage("backwardPic.png");
    tint(255, 255);
    image(backwardPic, 500,500,1000,1000);
  }
  if (key =='r'||key=='R') {//重做
    forwardPic = loadImage("forwardPic.png");
    tint(255, 255);
    image(forwardPic, 500,500,1000,1000);
  }
  if (key =='i'||key=='I') {//加深度
    brushcolor -= 5;
    if (brushcolor < 0) {
      brushcolor =  0;
    }
  }
  if (key =='d'||key=='D') {//减深度
    brushcolor += 5;
    if (brushcolor > 255) {
      brushcolor =  255;
    }
  }
  if (key =='e'||key=='E') {//橡皮
    brushcolor = 255;
  }
  if (key =='p'||key=='P') {//黑笔
    brushcolor = 0;
    r = 2.1;
  }
  if (key =='g'||key=='G') {//灰笔
    brushcolor = 185;
    r = 4.1;
    alpha = 15;
  }
  if (key =='q'||key=='Q') {//保存退出
    save("trial.png");
    exit();
  }
  if (key =='n'||key=='N') {//清除全部
    background(255);
  }
  if (key =='o'||key=='O') {//增加不透明度
    alpha +=5;
    if (alpha>255) {
      alpha = 255;
    }
  }
  if (key =='t'||key =='T') {//增加透明度
    alpha -=5;
    if (alpha<0) {
      alpha=1;
    }
  }
}
