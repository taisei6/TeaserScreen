class PastelStripe {
  PastelStripe(PGraphics _canvas) {
    x = random(width);
    w = (int)random(1, width/10);
    
    c = color_palette[(int)random(color_palette.length)];
    theta = random(0.0, PI/2);
    direction = random(-1.0, 1.0);
    canvas = _canvas;
  }
  void draw()
  {
    canvas.stroke(c, 100);
    canvas.strokeWeight(w);
    x = direction*0.5*width*sin(theta)+width/2;
    canvas.rect(x,0,w,height);
    //canvas.line(x, 0, x, width);
    theta += 0.01;
  }
  float x;
  float theta;
  float direction;
  float w;
  int color_palette[] = {#30A9D9, #D9B341, #F29D35, #F28963, #F24535};
  int c;
  PGraphics canvas;
}

class PastelStripes {
  PastelStripes(int _n) {
    canvas = createGraphics(width, height, P2D);
    ps = new PastelStripe[_n];
    for ( int i = 0; i < ps.length; i++ ) {
      ps[i] = new PastelStripe(canvas);
    }
  }
  void update(){
    canvas.beginDraw();
    canvas.background(#F2E4DC);
    for ( int i = 0; i < ps.length; i++ ) {
      ps[i].draw();
    }
    canvas.endDraw();
    
  }
  void draw()
  {
    draw(0, 0, width, height);
  }
  void draw(int _x, int _y, int _w, int _h)
  {
    update();
    image(canvas, _x, _y, _w, _h);
  }
  PGraphics canvas;
  PastelStripe ps[];
}
