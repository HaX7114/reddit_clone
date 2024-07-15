import 'package:reddit_clone/core/models/user_model.dart';

class Comment {
  final User user;
  final String text;
  final String date;
  final int likes;
  final List<Comment> replies;

  Comment(
      {required this.user,
      required this.text,
      this.date = '.  153d',
      this.likes = 0,
      this.replies = const []});
}
