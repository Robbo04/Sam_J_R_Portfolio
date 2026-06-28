import 'package:flutter/material.dart';
import 'particle.dart';

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double opacity;

  ParticlePainter(this.particles, this.opacity);

  @override
  void paint(Canvas canvas, Size size) {
    for (var p in particles) {
      final paint = Paint()..color = p.color.withOpacity(opacity);

      switch (p.type) {
        case ParticleType.circle:
          canvas.drawCircle(p.position, p.size, paint);
          break;

        case ParticleType.sprinkle:
          canvas.save();
          canvas.translate(p.position.dx, p.position.dy);
          canvas.rotate(p.rotation);

          canvas.drawRect(
            Rect.fromCenter(
              center: Offset.zero,
              width: p.size * 2,
              height: p.size * 0.8,
            ),
            paint,
          );

          canvas.restore();
          break;

        case ParticleType.square:
          canvas.drawRect(
            Rect.fromCenter(
              center: p.position,
              width: p.size,
              height: p.size,
            ),
            paint,
          );
          break;

        case ParticleType.triangle:
          final path = Path()
            ..moveTo(p.position.dx, p.position.dy - p.size)
            ..lineTo(p.position.dx - p.size, p.position.dy + p.size)
            ..lineTo(p.position.dx + p.size, p.position.dy + p.size)
            ..close();
          canvas.drawPath(path, paint);
          break;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
