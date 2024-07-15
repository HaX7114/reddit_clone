import 'package:flutter/material.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/layout/main_screen.dart';

class RedditCloneApp extends StatelessWidget {
  const RedditCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Reddit Clone',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
