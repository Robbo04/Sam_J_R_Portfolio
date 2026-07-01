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
  Duration? _lastElapsed;
  Offset _mousePosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_updateParticles)..start();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) setState(() => _opacity = 1.0);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_particles.isEmpty) {
      _createParticles();
    }
  }

  void _createParticles() {
    final rand = Random();
    final screenSize = MediaQuery.of(context).size;

    for (int i = 0; i < 120; i++) {
      final double particleSize = (rand.nextDouble() * 5) + 5;
      final startPos = Offset(
        rand.nextDouble() * screenSize.width,
        rand.nextDouble() * widget.height,
      );
      _particles.add(
        Particle(
          velocity: Offset.zero,
          size: particleSize,
          baseSize: particleSize,
          rotation: rand.nextDouble() * pi * 2,
          color: rand.nextBool() ? const Color.fromARGB(255, 60, 0, 255) : const Color.fromARGB(255, 86, 2, 169).withOpacity(0.7),
          type: rand.nextBool() ? ParticleType.circle : ParticleType.sprinkle,
          timeAlive: rand.nextDouble() * 10, // Randomize start phase
        )..startingPosition = startPos
          ..position = startPos,
      );
    }
  }

  void _updateParticles(Duration elapsed) {
    if (!mounted) return;
    final delta = _lastElapsed == null
        ? 0.016 // Default to ~60fps on first frame
        : (elapsed - _lastElapsed!).inMilliseconds / 1000.0;
    _lastElapsed = elapsed;
    
    // Clamp delta to reasonable range to prevent explosions
    final clampedDelta = delta.clamp(0.001, 0.1);
    
    final width = MediaQuery.of(context).size.width;

    for (final p in _particles) {
      p.timeAlive += clampedDelta;

      // 1. Continuous gentle floating using sine waves
      final floatX = sin(p.timeAlive * 0.5 + p.rotation) * 20;
      final floatY = cos(p.timeAlive * 0.3 + p.rotation * 2) * 20;
      final targetPos = p.startingPosition + Offset(floatX, floatY);

      // 2. Soft spring towards floating target
      final toTarget = targetPos - p.position;
      final springForce = toTarget * 0.02;
      p.velocity += springForce;

      // 3. Repel from mouse cursor
      final mouseDistance = (p.position - _mousePosition).distance;
      if (mouseDistance > 1 && mouseDistance < 150) {
        final repelDir = (p.position - _mousePosition) / mouseDistance;
        final repelStrength = (150 - mouseDistance) / 150;
        final repelForce = repelDir * repelStrength * 400 * clampedDelta;
        
        // Safety check for valid values
        if (repelForce.dx.isFinite && repelForce.dy.isFinite) {
          p.velocity += repelForce;
        }
      }

      // 4. Apply damping
      p.velocity *= 0.95;

      // 5. Apply velocity to position
      final newPosition = p.position + p.velocity * clampedDelta;
      
      // Safety check for valid position
      if (newPosition.dx.isFinite && newPosition.dy.isFinite) {
        p.position = newPosition;
      }

      // 6. Wrap around screen edges
      if (p.position.dx < -50) {
        p.position = Offset(width + 50, p.position.dy);
        p.startingPosition = Offset(width + 50, p.startingPosition.dy);
      }
      if (p.position.dx > width + 50) {
        p.position = Offset(-50, p.position.dy);
        p.startingPosition = Offset(-50, p.startingPosition.dy);
      }
      if (p.position.dy < -50) {
        p.position = Offset(p.position.dx, widget.height + 50);
        p.startingPosition = Offset(p.startingPosition.dx, widget.height + 50);
      }
      if (p.position.dy > widget.height + 50) {
        p.position = Offset(p.position.dx, -50);
        p.startingPosition = Offset(p.startingPosition.dx, -50);
      }

      // 7. Adjust size based on mouse distance
      final sizeFactor = (mouseDistance / 150).clamp(0.5, 1.0);
      p.size = p.baseSize * sizeFactor;
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
    return MouseRegion(
      onHover: (event) => setState(() => _mousePosition = event.position),
      child: SizedBox(
        height: widget.height,
        width: MediaQuery.of(context).size.width,
        child: CustomPaint(
          painter: ParticlePainter(_particles, _opacity),
        ),
      ),
    );
  }
}
