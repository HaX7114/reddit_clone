import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/video_screen_cubit/video_screen_cubit.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/video_screen_cubit/video_screen_cubit_states.dart';
import 'package:reddit_clone/core/presentation/shared_widgets/caption_text.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_colors.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_spaces.dart';

class VideoLikesAndComments extends StatelessWidget {
  const VideoLikesAndComments({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoScreenCubit, VideoScreenCubitStates>(
      builder: (context, state) => Container(
        color: AppColors.blackColor,
        height: 40,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 60,
            right: 60,
            bottom: 15,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  VideoScreenCubit.ofCurrentContext(context)
                      .handlingVideoLikesCounter();
                },
                child: Icon(
                  Icons.arrow_upward_rounded,
                  size: 29,
                  color: VideoScreenCubit.ofCurrentContext(context)
                          .likesCounterIsActive
                      ? AppColors.orangeColor
                      : AppColors.whiteColor,
                ),
              ),
              AppSpaces.hSpace5,
              CaptionText(
                text: VideoScreenCubit.ofCurrentContext(context)
                    .likesCounter
                    .toString(),
                fontSize: 14,
              ),
              AppSpaces.hSpace40,
              GestureDetector(
                onTap: () {
                  VideoScreenCubit.ofCurrentContext(context)
                      .handlingVideoDisLikesCounter();
                },
                child: Icon(
                  Icons.arrow_downward_rounded,
                  size: 29,
                  color: VideoScreenCubit.ofCurrentContext(context)
                          .dislikesCounterIsActive
                      ? AppColors.orangeColor
                      : AppColors.whiteColor,
                ),
              ),
              AppSpaces.hSpace40,
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  CupertinoIcons.chat_bubble,
                  size: 29,
                  color: AppColors.whiteColor,
                ),
              ),
              AppSpaces.hSpace10,
              const CaptionText(
                text: '30',
                fontSize: 14,
              ),
              AppSpaces.expandedSpace,
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  CupertinoIcons.arrowshape_turn_up_right,
                  size: 29,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
