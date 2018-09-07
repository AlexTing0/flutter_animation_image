import 'package:flutter/material.dart';

import 'package:flutter_animation_image/flutter_animation_image.dart';

void main() => runApp(new MyApp());

List<Image> images;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (images == null) {
      images = new List<Image>(42);
      for (int i = 0; i < 42; ++i) {
        images[i] = Image.asset(
          'images/$i.gif',
          gaplessPlayback: true
        );
      }
    }

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: AnimationImage(
        images:images,
        repeat: true,
      ),
    );
  }
}

