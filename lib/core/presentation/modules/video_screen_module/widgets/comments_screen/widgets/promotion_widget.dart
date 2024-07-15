import 'package:flutter/material.dart';
import 'package:reddit_clone/core/presentation/shared_widgets/caption_text.dart';
import 'package:reddit_clone/core/presentation/shared_widgets/main_button.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_border_radius.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_colors.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_spaces.dart';

class PromotionWidget extends StatelessWidget {
  const PromotionWidget({super.key});

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
                AppSpaces.hSpace10,
                const CaptionText(
                  text: 'gelatoconnects',
                  fontWeight: FontWeight.w900,
                  color: AppColors.lightGrey,
                  fontSize: 13,
                ),
                AppSpaces.hSpace10,
                const CaptionText(
                  text: 'Promoted',
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                  color: AppColors.lightGrey,
                ),
                AppSpaces.expandedSpace,
                const Icon(
                  Icons.more_horiz,
                  size: 30,
                  color: AppColors.lightGrey,
                ),
              ],
            ),
            AppSpaces.vSpace10,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CaptionText(
                        color: AppColors.lightGrey,
                        maxLines: 5,
                        text:
                            "Looking to scale your business? Design personalization made easy: Gelato Platinum",
                        fontSize: 15,
                      ),
                      AppSpaces.vSpace100,
                      AppSpaces.vSpace10,
                      const CaptionText(
                        color: AppColors.lightGrey,
                        text: "gelato.com",
                        fontSize: 13,
                      ),
                    ],
                  ),
                ),
                AppSpaces.hSpace20,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: AppCircularRadius.radius5,
                        child: Image.network(
                            height: 150,
                            width: 150,
                            "https://static-00.iconduck.com/assets.00/reddit-icon-1024x1024-hn49py6n.png"),
                      ),
                      AppSpaces.vSpace10,
                      MainButton(
                        innerText: 'Learn More',
                        color: AppColors.lightGrey,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
