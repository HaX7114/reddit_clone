import 'package:flutter/material.dart';
import 'package:reddit_clone/core/presentation/shared_widgets/caption_text.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_colors.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_spaces.dart';

class BestCommentsTitleWidget extends StatelessWidget {
  const BestCommentsTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          const Icon(
            Icons.rocket_outlined,
            size: 30,
            color: AppColors.lightGrey,
          ),
          AppSpaces.hSpace10,
          const CaptionText(
            text: 'BEST COMMENTS',
            color: AppColors.lightGrey,
          ),
          AppSpaces.hSpace10,
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 30,
            color: AppColors.lightGrey,
          ),
        ],
      ),
    );
  }
}
