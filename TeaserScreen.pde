WarmingGeometry wg;
NoiseLines nls;
PastelStripes ps;
PFont f;

void setup()
{
  //pixelDensity(displayDensity());
 

  frameRate(30); // slower as possible

  wg = new WarmingGeometry(10, 40, 280);
  nls = new NoiseLines(12, 5);
  ps = new PastelStripes(7);

  size(1280,720,P2D);
  //fullScreen(P2D,1); // number of display
  
   int font_size = height/10;
  PFont f = createFont("Jaldi-Bold.ttf", font_size);  
  textFont(f); // 読み込んだフォント f を表示用テキストフォントに変更
  textLeading(font_size);
}
int size_of_effect = 3;


String title = "";
boolean flg_begin_workshop = false;
int kind_of_effect = (int)random((int)size_of_effect);


void draw()
{ 

  switch( kind_of_effect )
  {
  case 0:
    wg.draw();
    fill(100);
    break;
  case 1:
    nls.draw();
    fill(100);
    break;
  case 2:
    ps.draw();
    fill(100);
    break;
  }


  if ( !flg_begin_workshop ) {
    drawClock(width/2, height/4);
    // Draw Typed Message
    if ( title.length() > 0 ) {
      text(title, width/2, height/2);
    }
  } else {
    noStroke();
    fill(0,0,0,150);
    rect(0,0,width,height);
    fill(255);
    text("It's about to start...", width/2, height/2);
  }
}

void keyPressed()
{

  println((int)keyCode);
  if (key == CODED) {  // UP, DOWN, LEFT, and RIGHT) as well as ALT, CONTROL, and SHIFT. 
    if (keyCode == UP || keyCode == RIGHT) {
      kind_of_effect++;
      if ( kind_of_effect >= size_of_effect ) kind_of_effect = 0;
    } else if (keyCode == DOWN || keyCode == LEFT) {
      kind_of_effect--;
      if ( kind_of_effect < 0 )kind_of_effect = size_of_effect-1;
    } else if (keyCode == 112) { // F1
      flg_begin_workshop = !flg_begin_workshop;
    }
  } else { // BACKSPACE, TAB, ENTER, RETURN, ESC, and DELETE and other keys
    if ( key == BACKSPACE ) {
      if ( title.length() > 0 ) {
        title = title.substring(0, title.length()-1);
      }
    } else {
      title = title + str(key);
    }
  }
}
