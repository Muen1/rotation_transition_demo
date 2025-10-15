import 'package:flutter/material.dart';

void main() => runApp(const RotationDemo());

class RotationDemo extends StatefulWidget {
  const RotationDemo({super.key});

  @override
  State<RotationDemo> createState() => _RotationDemoState();
}

class _RotationDemoState extends State<RotationDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Controls how long one full rotation takes
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(); // Spins continuously
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('RotationTransition Demo')),
        body: Center(
          child: RotationTransition(
            // 1️⃣ controls how much the widget rotates
            turns: _controller,

            // 2️⃣ decides the point around which rotation happens
            alignment: Alignment.center,

            // 3️⃣ the widget being rotated
            child: const Icon(Icons.refresh, size: 80, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
