import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'particle.dart';
import 'particle_painter.dart';

class ParticleField extends StatefulWidget {
  final double height; // hero height

  const ParticleField({super.key, required this.height});

  @override
  State<ParticleField> createState() => _ParticleFieldState();
}

class _ParticleFieldState extends State<ParticleField>
    with SingleTickerProviderStateMixin {

  late final Ticker _ticker;
  final List<Particle> _particles = [];
  double _opacity = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_particles.isEmpty) {
      _createParticles();
    }

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() => _opacity = 1.0);
    });

    _ticker = createTicker(_updateParticles)..start();
  }

  void _createParticles() {
    final rand = Random();
    final size = MediaQuery.of(context).size;

    for (int i = 0; i < 120; i++) {
      _particles.add(
        Particle(
          position: Offset(
            rand.nextDouble() * size.width,
            rand.nextDouble() * widget.height,
          ),
          velocity: Offset(rand.nextDouble() - 0.5, rand.nextDouble() - 0.5),
          size: rand.nextDouble() * 3 + 1,
          rotation: rand.nextDouble() * pi,
          color: Colors.white,
          type: rand.nextBool()
              ? ParticleType.circle
              : ParticleType.sprinkle,
        ),
      );
    }
  }

  void _updateParticles(Duration dt) {
    final delta = dt.inMilliseconds / 1000.0;
    final width = MediaQuery.of(context).size.width;

    for (final p in _particles) {
      p.position += p.velocity * delta;

      if (p.position.dx < 0) p.position = Offset(p.position.dx + width, p.position.dy);
      if (p.position.dx > width) p.position = Offset(p.position.dx - width, p.position.dy);

      if (p.position.dy < 0) p.position = Offset(p.position.dx, p.position.dy + widget.height);
      if (p.position.dy > widget.height) p.position = Offset(p.position.dx, p.position.dy - widget.height);
    }

    setState(() {});
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: MediaQuery.of(context).size.width,
      child: CustomPaint(
        painter: ParticlePainter(_particles, _opacity),
      ),
    );
  }
}
