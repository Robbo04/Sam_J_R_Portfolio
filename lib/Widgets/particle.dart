import 'package:flutter/material.dart';

enum ParticleType { circle, sprinkle, square, triangle }

class Particle {
  Offset position;
  Offset velocity;
  double size;
  double rotation;
  Color color;
  ParticleType type;

  
  Particle({
    required this.position,
    required this.velocity,
    required this.size,
    required this.rotation,
    required this.color,
    required this.type,
  });
}