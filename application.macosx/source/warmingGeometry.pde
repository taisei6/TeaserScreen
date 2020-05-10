class Spot {
  Spot(float _x, float _y, int _c, float _r) {
    x = x_init = _x;
    y = y_init = _y;
    c = _c;
    r = _r;
    param_noise = random(10000.0);
    position_noise_x = random(10000.0);
    position_noise_y = random(10000.0);
    increment_noise = 0.01;
    increment_noise_position = 0.001;
    number_of_vertex = (int)random(3, 6);
  }

  void draw()
  {
    param_noise = param_noise+increment_noise;
    position_noise_x += increment_noise_position;
    position_noise_y += increment_noise_position;
    x = x_init + 100*noise(position_noise_x);
    y = y_init + 100*noise(position_noise_y);

    noStroke();
    fill(c, 200);
    beginShape();
    for ( float angle = 0.0; angle < 360.0; angle = angle + 360/number_of_vertex ) {
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
    int[] c = new int[]{#3C88A6, #C6D4C8, #F2DC9B, #CB862C, #D99C9C};
    spot = new Spot[_n];
    for ( int i = 0; i < spot.length; i++ ) {
      spot[i] = new Spot(random(width), random(height), c[int(random(c.length))], random(_r_min, _r_max));
    }
  }
  void draw() {
    background(#F2E4DC);
    for ( int i = 0; i < spot.length; i++ ) {
      spot[i].draw();
    }
  }
  Spot spot[];
};
