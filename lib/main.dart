import 'package:flutter/material.dart';
import 'package:guideline/guideline_overlay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Stack(children: [MainPage(), GuidelineOverlay()]),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Index của màn hình hiện tại
  int _currentIndex = 0;

  // Danh sách các màn hình
  final List<Widget> _screens = const [ScreenA(), ScreenB(), ScreenC()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        backgroundColor: Colors.blue.shade100,
      ),

      // Hiển thị màn hình tương ứng
      body: IndexedStack(index: _currentIndex, children: _screens),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Screen A'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Screen B'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Screen C'),
        ],
      ),
    );
  }
}

// Screen A
class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Screen A'));
  }
}

// Screen B
class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Screen B'));
  }
}

// Screen C
class ScreenC extends StatelessWidget {
  const ScreenC({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Screen C'));
  }
}
