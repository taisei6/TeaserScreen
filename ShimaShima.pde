class shima {
  shima() {
    x = (int)random(displayWidth);
    w = (int)random(1,60);
    noise_param = random(1000.0);
    c = color_palette[(int)random(color_palette.length)];  
  }
  void draw()
  {
    stroke(c, 100);
    strokeWeight(w);
    x = (int)(displayWidth*noise(noise_param));
    line(x, 0, x, displayHeight);
    noise_param += 0.005;
  }
  int x;
  int w;
  float noise_param;
  int color_palette[] = {#30A9D9,#D9B341,#F29D35,#F28963,#F24535};
  int c;
}

class shimashima {
  shimashima(int _n) {
    s = new shima[_n];
    for( int i = 0; i < s.length; i++ ){
      s[i] = new shima();
    }
  }
  void draw()
  {
    background(255);
    for( int i = 0; i < s.length; i++ ){
      s[i].draw();
    }
  }
  shima s[];
}
