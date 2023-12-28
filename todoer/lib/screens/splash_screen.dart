import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';
import 'todo_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TaskData>(context, listen: false).getTaskListFromDatabase();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const TodoScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText('todoer',
                textStyle: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                colors: [
                  Colors.white,
                  Colors.lightBlue,
                  Colors.blue,
                  Colors.lightBlue,
                  Colors.white,
                ],
                speed: const Duration(milliseconds: 300)),
          ],
          totalRepeatCount: 5,
        ),
      ),
    );
  }
}
