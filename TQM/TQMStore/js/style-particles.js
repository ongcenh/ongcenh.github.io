particlesJS('particles-js',
  
  {
    "particles": {
      "number": {
        "value": 175,
        "density": {
          "enable": true,
          "value_area": 800
        }
      },
      "color": {
        "value": "#FFF"
      },
      "shape": {
        "type": "circle",
        "stroke": {
          "width": 3,
          "color": "#FFF"
        },
        "polygon": {
          "nb_sides": 5
        }
      },
      "opacity": {
        "random": false,
        "anim": {
          "enable": false,
          "speed": 2,
          "opacity_min": 0.1,
          "sync": false
        }
      },
      "size": {
        "value": 5,
        "random": true,
        "anim": {
          "enable": false,
          "speed": 40,
          "size_min": 0.2,
          "sync": false
        }
      },
      "line_linked": {
        "enable": true,
        "distance": 50,
        "color": "#FFF",
        "width": 4
      },
      "move": {
        "enable": true,
        "speed": 6,
        "direction": "none",
        "random": false,
        "straight": false,
        "out_mode": "out",
        "attract": {
          "enable": false,
          "rotateX": 600,
          "rotateY": 1200
        }
      }
    },
    "interactivity": {
      "detect_on": "canvas",
      "events": {
        "onhover": {
          "enable": true,
          "mode": "repulse"
        },
        "onclick": {
          "enable": true,
          "mode": "push"
        },
        "resize": true
      },
      "modes": {
        "grab": {
          "distance": 500,
          "line_linked": {
            "opacity": 1
          }
        },
        "bubble": {
          "distance": 500,
          "size": 50,
          "duration": 2,
          "opacity": 8,
          "speed": 3
        },
        "repulse": {
          "distance": 200
        },
        "push": {
          "particles_nb": 4
        },
        "remove": {
          "particles_nb": 2
        }
      }
    },
    "retina_detect": true,
    "config_demo": {
      "hide_card": false,
      "background_color": "#FFF",
      "background_image": "",
      "background_position": "100% 100%",
      "background_repeat": "no-repeat",
      "background_size": "cover"
    }
  }

);
