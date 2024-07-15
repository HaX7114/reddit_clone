import 'package:flutter/material.dart';
import 'package:reddit_clone/core/presentation/shared_widgets/caption_text.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_colors.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_spaces.dart';

class UserDataAndDateWidget extends StatelessWidget {
  final String userImage;
  final String username;
  final String date;
  const UserDataAndDateWidget({
    super.key,
    required this.userImage,
    required this.username,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundImage: NetworkImage(userImage),
        ),
        AppSpaces.hSpace5,
        CaptionText(
          text: username,
          fontWeight: FontWeight.w900,
          fontSize: 13,
        ),
        AppSpaces.hSpace5,
        CaptionText(
          text: date,
          fontWeight: FontWeight.w900,
          color: AppColors.lightGrey,
          fontSize: 12,
        ),
      ],
    );
  }
}
