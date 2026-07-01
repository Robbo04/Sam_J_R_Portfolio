import 'package:flutter/material.dart';

enum ParticleType { circle, sprinkle, square, triangle }

class Particle {
  late Offset position;
  late Offset startingPosition;
  Offset velocity;
  double size;
  double baseSize;
  double rotation;
  Color color;
  ParticleType type;
  double timeAlive;

  Particle({
    required this.velocity,
    required this.size,
    required this.baseSize,
    required this.rotation,
    required this.color,
    required this.type,
    this.timeAlive = 0,
  }) {
    position = Offset.zero;
    startingPosition = Offset.zero;
  }
}