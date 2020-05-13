class PastelStripe {
  PastelStripe() {
    x = random(width);
    w = (int)random(1,300);
    noise_param = random(1000.0);
    c = color_palette[(int)random(color_palette.length)];  
  }
  void draw()
  {
    stroke(c,100);
    strokeWeight(w);
    x = (width*noise(noise_param));
    line(x, 0, x, width);
    noise_param += 0.0001;
  }
  float x;
  int w;
  float noise_param;
  int color_palette[] = {#30A9D9,#D9B341,#F29D35,#F28963,#F24535};
  int c;
}

class PastelStripes {
   PastelStripes(int _n) {
    ps = new PastelStripe[_n];
    for( int i = 0; i < ps.length; i++ ){
      ps[i] = new PastelStripe();
    }
  }
  void draw()
  {
    background(#F2E4DC);
    for( int i = 0; i < ps.length; i++ ){
      ps[i].draw();
    }
  }
  PastelStripe ps[];
}
