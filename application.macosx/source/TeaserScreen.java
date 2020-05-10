import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class TeaserScreen extends PApplet {

WarmingGeometry warming_geometry;
PFont f;
public void setup()
{
  //pixelDensity(displayDensity());
  int font_size = displayHeight/10;
  PFont f = createFont("Jaldi-Bold.ttf", font_size);  
  textFont(f); // 読み込んだフォント f を表示用テキストフォントに変更
  textLeading(font_size); 
  frameRate(10);
  warming_geometry = new WarmingGeometry(10, 40, 280);  
  //size(displayWidth, displayHeight, P2D);
  
}

String title = "";
boolean flg_first_in = true;
public void draw()
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

public void keyPressed()
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
public String getWeekName() {
  /*
  計算方法はツェラーの公式を参照
   https://ja.wikipedia.org/wiki/%E3%83%84%E3%82%A7%E3%83%A9%E3%83%BC%E3%81%AE%E5%85%AC%E5%BC%8F
   */
  int y = year();
  int m = month();
  int d = day();
  int Y=y % 100;
  int C=PApplet.parseInt(y/100);
  int L=-2*C+C/4;
  switch( (d+26*(m+1)/10+Y+Y/4+L)%7 )
  {
  case 1:
    return "Sun";
  case 2:
    return "Mon";
  case 3:
    return "Tue";
  case 4:
    return "Wed";
  case 5:
    return "Thr";
  case 6:
    return "Fri";
  case 0:
    return "Sat";
  }
  return "Error";
}
class Spot {
  Spot(float _x, float _y, int _c, float _r) {
    x = x_init = _x;
    y = y_init = _y;
    c = _c;
    r = _r;
    param_noise = random(10000.0f);
    position_noise_x = random(10000.0f);
    position_noise_y = random(10000.0f);
    increment_noise = 0.01f;
    increment_noise_position = 0.001f;
    number_of_vertex = (int)random(3, 6);
  }

  public void draw()
  {
    param_noise = param_noise+increment_noise;
    position_noise_x += increment_noise_position;
    position_noise_y += increment_noise_position;
    x = x_init + 100*noise(position_noise_x);
    y = y_init + 100*noise(position_noise_y);

    noStroke();
    fill(c, 200);
    beginShape();
    for ( float angle = 0.0f; angle < 360.0f; angle = angle + 360/number_of_vertex ) {
      float circle_noise = 20*noise(
        param_noise+cos(radians(angle)), 
        param_noise+sin(radians(angle))
        );

      vertex(
        x + (r+circle_noise)*cos(radians(angle)), 
        y + (r+circle_noise)*sin(radians(angle)));
    }
    endShape();
  }

  float x;
  float y;
  float x_init;
  float y_init;
  int c;
  float r;
  float param_noise;
  float position_noise_x;
  float position_noise_y;
  float increment_noise;
  float increment_noise_position;
  int number_of_vertex;
};

class WarmingGeometry {
  WarmingGeometry(int _n, float _r_min, float _r_max) {
    int[] c = new int[]{0xff3C88A6, 0xffC6D4C8, 0xffF2DC9B, 0xffCB862C, 0xffD99C9C};
    spot = new Spot[_n];
    for ( int i = 0; i < spot.length; i++ ) {
      spot[i] = new Spot(random(width), random(height), c[PApplet.parseInt(random(c.length))], random(_r_min, _r_max));
    }
  }
  public void draw() {
    background(0xffF2E4DC);
    for ( int i = 0; i < spot.length; i++ ) {
      spot[i].draw();
    }
  }
  Spot spot[];
};
  public void settings() {  fullScreen(1); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "TeaserScreen" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
