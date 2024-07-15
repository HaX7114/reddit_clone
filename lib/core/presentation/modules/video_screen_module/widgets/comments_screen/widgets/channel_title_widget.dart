import 'package:flutter/material.dart';
import 'package:reddit_clone/core/presentation/shared_widgets/caption_text.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_colors.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_spaces.dart';

class ChannelTitleWidget extends StatelessWidget {
  const ChannelTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.commentWidgetBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 14,
                  backgroundImage: NetworkImage(
                      "https://static-00.iconduck.com/assets.00/reddit-icon-1024x1024-hn49py6n.png"),
                ),
                AppSpaces.hSpace5,
                const CaptionText(
                  text: 'u/Channed-video',
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                ),
                AppSpaces.hSpace5,
                const CaptionText(
                  text: '.  153d',
                  fontWeight: FontWeight.w900,
                  color: AppColors.lightGrey,
                  fontSize: 12,
                ),
              ],
            ),
            AppSpaces.vSpace10,
            const CaptionText(
              text: 'Beatiful Video .... Must Watch',
              fontSize: 13,
            ),
          ],
        ),
      ),
    );
  }
}
