import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:splash_music_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Ambiance(),
    );
  }
}

class Ambiance extends StatefulWidget {
  const Ambiance({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AmbianceState createState() => _AmbianceState();
}

class _AmbianceState extends State<Ambiance>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: const Color(0xff362c4c),
      end: const Color.fromARGB(255, 0, 0, 0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      _colorAnimation.value!,
                      _colorAnimation.value!.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: FloatingBubbles(
                  colorsOfBubbles: [
                    Color.alphaBlend(Colors.white10, const Color(0xff362c4c)),
                  ],
                  sizeFactor: 0.16,
                  duration: 120,
                  opacity: 70,
                  paintingStyle: PaintingStyle.fill,
                  strokeWidth: 8,
                  shape: BubbleShape.circle,
                  speed: BubbleSpeed.slow,
                  noOfBubbles: 40,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome to KANSO!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'What will you like to be called?',
                          hintStyle: const TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.702)),
                          fillColor: Colors.white.withOpacity(0.2),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: const Text('Get Started'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
