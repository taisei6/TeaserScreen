WarmingGeometry warming_geometry;
PFont f;
void setup()
{
  //pixelDensity(displayDensity());
  int font_size = displayHeight/10;
  PFont f = createFont("Jaldi-Bold.ttf", font_size);  
  textFont(f); // 読み込んだフォント f を表示用テキストフォントに変更
  textLeading(font_size); 
  frameRate(10); // slower as possible
  warming_geometry = new WarmingGeometry(10, 40, 280);  
  //size(displayWidth, displayHeight, P2D);
  fullScreen(1); // number of display
}

String title = "";
void draw()
{ 
  warming_geometry.draw();
    
  fill(100);
  drawClock(width/2, height/4);
  // Draw Typed Message
  if ( title.length() > 0 ) {
    text(title, width/2, height/2);
  }
 

}

void keyPressed()
{

  if ( key == 65535 )return;
  if ( key == BACKSPACE ) {
    if ( title.length() > 0 ) {
      title = title.substring(0, title.length()-1);
    }
  } else {
    title = title + str(key);
  }
}
