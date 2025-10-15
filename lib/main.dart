import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const RefreshQuoteApp());
}

class RefreshQuoteApp extends StatefulWidget {
  const RefreshQuoteApp({super.key});

  @override
  State<RefreshQuoteApp> createState() => _RefreshQuoteAppState();
}

class _RefreshQuoteAppState extends State<RefreshQuoteApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isRefreshing = false;
  String _quote = "“Stay positive and keep learning Flutter!”";

  final List<String> _quotes = [
    "“Believe you can and you’re halfway there.”",
    "“Code. Debug. Repeat.”",
    "“Don’t watch the clock; do what it does — keep going.”",
    "“Every bug is an opportunity to learn.”",
    "“Stay positive and keep learning Flutter!”",
  ];

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

  void _refreshQuote() {
    if (_isRefreshing) return;
    setState(() => _isRefreshing = true);
    _controller.repeat();

    // Simulate loading new data (e.g., from an API)
    Future.delayed(const Duration(seconds: 3), () {
      _controller.stop();
      setState(() {
        _isRefreshing = false;
        _quote = _quotes[Random().nextInt(_quotes.length)];
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quote refreshed successfully!')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RotationTransition Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Daily Motivation')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotationTransition(
                  turns: _controller,
                  alignment: Alignment.center,
                  child: const Icon(Icons.refresh, size: 80, color: Colors.blue),
                ),
                const SizedBox(height: 40),
                Text(
                  _quote,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: _refreshQuote,
                  icon: const Icon(Icons.refresh),
                  label: Text(_isRefreshing ? 'Refreshing...' : 'New Quote'),
                ),
              ],
            ),
          ),
        ),
      )