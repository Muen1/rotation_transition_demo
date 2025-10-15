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