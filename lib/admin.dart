import 'package:flutter/material.dart';
void main() {
  runApp(AdminApp());
}
class AdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AdminScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AdminScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Admin"),
      ),
      body: const Center(
        child: Text("Hello, Admin!"),
      ),
    );
  }
}