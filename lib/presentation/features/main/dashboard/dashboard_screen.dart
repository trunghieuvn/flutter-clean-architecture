import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  final List<Widget> pages;

  const DashboardScreen({
    super.key,
    required this.pages,
  });
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Singapore’s mobile networks'),
      ),
      body: IndexedStack(
        key: const ValueKey('dashboard_IndexedStack'),
        children: widget.pages,
      ),
    );
  }
}
