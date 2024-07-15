import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/core/presentation/shared_widgets/caption_text.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_colors.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_spaces.dart';

class VideoAppBar extends StatelessWidget {
  const VideoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        top: 10,
        bottom: 60,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.xmark,
              color: AppColors.whiteColor,
              size: 30,
            ),
          ),
          AppSpaces.expandedSpace,
          Row(
            children: [
              const CircleAvatar(
                radius: 14,
                backgroundImage: NetworkImage(
                    "https://static-00.iconduck.com/assets.00/reddit-icon-1024x1024-hn49py6n.png"),
              ),
              AppSpaces.hSpace10,
              const CaptionText(
                text: 'r/aww',
                fontWeight: FontWeight.w900,
                fontSize: 13,
              ),
            ],
          ),
          AppSpaces.expandedSpace,
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              color: AppColors.whiteColor,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
