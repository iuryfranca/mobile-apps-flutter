import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'The Last Of Us Part II - Remastered';
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 57, 57),
      ),
      title: appTitle,
      home: Scaffold(
        body: Container(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.translate(
              offset: const Offset(0, 0),
              child: Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.01)
                  ..rotateY(0),
                child: Container(
                  height: 220,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(22)),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(-20, 0),
              child: Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.01)
                  ..rotateY(0.1),
                child: Container(
                  height: 188,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(Radius.circular(22)),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Transform.translate(
                offset: Offset(-20, 0),
                child: Image.network(
                  'https://flutter4fun.com/wp-content/uploads/2020/11/Player-1.png',
                  width: 280,
                  height: 280,
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
