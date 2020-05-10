WarmingGeometry warming_geometry;
PFont f;
void setup()
{
  //pixelDensity(displayDensity());
  int font_size = displayHeight/10;
  PFont f = createFont("Jaldi-Bold.ttf", font_size);  
  textFont(f); // 読み込んだフォント f を表示用テキストフォントに変更
  textLeading(font_size); 
  frameRate(10);
  warming_geometry = new WarmingGeometry(10, 40, 280);  
  //size(displayWidth, displayHeight, P2D);
  fullScreen(1);
}

String title = "";
boolean flg_first_in = true;
void draw()
{
  warming_geometry.draw();
  fill(100);
  if ( title.length() > 0 ) {
    text(title, width/2, height/2);
  }

  String str_date;
  str_date = nf(month(), 2)+"." +nf(day(), 2)+"."+getWeekName()+"\n";
  str_date = str_date + nf(hour(), 2)+":"+nf(minute(), 2)+":"+nf(second(), 2);
  text(str_date, width/2, height/4);
}

void keyPressed()
{
  
  if ( key == 65535 )return;
  if ( key == BACKSPACE ) {
    if ( title.length() > 0 ) {
      title = title.substring(0, title.length()-1);
    }
  }
  else {
    title = title + str(key);
  }
  
}
