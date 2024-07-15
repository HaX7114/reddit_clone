import 'package:flutter/material.dart';
import 'package:reddit_clone/core/presentation/shared_widgets/caption_text.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_spaces.dart';

class VideoChannelAndTitle extends StatelessWidget {
  const VideoChannelAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            bottom: 30,
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 14,
                backgroundImage: NetworkImage(
                    "https://static-00.iconduck.com/assets.00/reddit-icon-1024x1024-hn49py6n.png"),
              ),
              AppSpaces.hSpace10,
              const CaptionText(
                text: 'u/Channed-video',
                fontWeight: FontWeight.w900,
                fontSize: 13,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            bottom: 70,
            left: 35,
          ),
          child: CaptionText(
            text: 'Beatiful Video .... Must Watch',
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
