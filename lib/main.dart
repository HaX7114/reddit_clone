import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/bloc_observer.dart';
import 'package:reddit_clone/core/app/reddit_clone_app/reddit_clone_app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const RedditCloneApp());
}
