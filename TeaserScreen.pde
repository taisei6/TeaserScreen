WarmingGeometry wg;
NoiseLines nls;
PFont f;
void setup()
{
  //pixelDensity(displayDensity());
  int font_size = displayHeight/10;
  PFont f = createFont("Jaldi-Bold.ttf", font_size);  
  textFont(f); // 読み込んだフォント f を表示用テキストフォントに変更
  textLeading(font_size); 

  frameRate(10); // slower as possible

  wg = new WarmingGeometry(10, 40, 280);
  nls = new NoiseLines(12, 5);

  //size(displayWidth, displayHeight, P2D);
  fullScreen(1); // number of display
}

String title = "";
int kind_of_effect = 0;
int size_of_effect = 2;
void draw()
{ 
  switch( kind_of_effect )
  {
  case 0:
    wg.draw();
    break;
  case 1:
    nls.draw();
    break;
  }


  fill(100);
  drawClock(width/2, height/4);
  // Draw Typed Message
  if ( title.length() > 0 ) {
    text(title, width/2, height/2);
  }
}

void keyPressed()
{

  println((int)keyCode);
  if (key == CODED) {  // UP, DOWN, LEFT, and RIGHT) as well as ALT, CONTROL, and SHIFT. 
    if (keyCode == UP || keyCode == RIGHT) {
      kind_of_effect++;
      if( kind_of_effect >= size_of_effect ) kind_of_effect = 0;
    } else if (keyCode == DOWN || keyCode == LEFT) {
      kind_of_effect--;
      if( kind_of_effect < 0 )kind_of_effect = size_of_effect-1; 
    }
  } else { // BACKSPACE, TAB, ENTER, RETURN, ESC, and DELETE and other keys
    if ( key == BACKSPACE ) {
      if ( title.length() > 0 ) {
        title = title.substring(0, title.length()-1);
      }
    } 
    else {
      title = title + str(key);
    }
  }
}
