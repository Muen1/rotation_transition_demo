import 'package:flutter/material.dart';

void main() {
  runApp(const RotationTransitionDemo());
}

class RotationTransitionDemo extends StatefulWidget {
  const RotationTransitionDemo({super.key});

  @override
  State<RotationTransitionDemo> createState() => _RotationTransitionDemoState();
}

class _RotationTransitionDemoState extends State<RotationTransitionDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _refreshData() {
    if (_isRefreshing) return; // Prevent multiple taps
    setState(() => _isRefreshing = true);

    // Start spinning animation
    _controller.repeat();

    // Simulate a fake 4-second data load
    Future.delayed(const Duration(seconds: 4), () {
      _controller.stop();
      setState(() => _isRefreshing = false);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data refreshed successfully!')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('RotationTransition Demo')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: _controller,
                alignment: Alignment.center,
                child: const Icon(Icons.refresh, size: 80, color: Colors.blue),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: _refreshData,
                icon: const Icon(Icons.refresh),
                label: Text(_isRefreshing ? 'Refreshing...' : 'Refresh Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}