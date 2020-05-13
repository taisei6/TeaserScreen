class NoiseLine { //<>//
  NoiseLine(int _number_of_vertex) {
    number_of_vertex = _number_of_vertex;
    param_noise = random(1000.0);
    x = 0;
    y = (int)random(displayHeight);
    w = displayWidth;
    h = displayHeight;
  }
  int x;
  int y;
  int w;
  int h;
  int number_of_vertex;
  float param_noise;
  void draw()
  {
    float step = width/(float)number_of_vertex;
    stroke(#3C88A6, noise(param_noise)*255);
    beginShape();
    for ( int i = 0; i <= number_of_vertex; i++ ) {
      vertex(i*step, noise(param_noise)*height);
      param_noise += 0.001;
      println(i*step);
    }

    endShape();
  }
}

class NoiseLines {
  NoiseLines(int _n, int _number_of_vertex) {
    nl = new NoiseLine[_n];
    for ( int i = 0; i < _n; i++ ) {
      nl[i] = new NoiseLine(_number_of_vertex);
    }
  }
  void draw() {
    background(#F2E4DC);
    noFill();
    strokeWeight(3);

    for ( int i = 0; i < nl.length; i++ ) {
      nl[i].draw();
    }
  }
  NoiseLine nl[];
}
