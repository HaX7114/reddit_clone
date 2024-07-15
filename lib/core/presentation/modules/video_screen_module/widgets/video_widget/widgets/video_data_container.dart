import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/video_screen_cubit/video_screen_cubit.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/video_screen_cubit/video_screen_cubit_states.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/video_widget/widgets/widgets/video_app_bar.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/video_widget/widgets/widgets/video_channel_and_title.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/video_widget/widgets/widgets/video_likes_and_comments.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_spaces.dart';

class VideoDataContainer extends StatelessWidget {
  const VideoDataContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoScreenCubit, VideoScreenCubitStates>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: VideoScreenCubit.ofCurrentContext(context)
                .videoDataContainerIsShown,
            child: const VideoAppBar(),
          ),
          AppSpaces.expandedSpace,
          Visibility(
            visible: VideoScreenCubit.ofCurrentContext(context)
                .videoDataContainerIsShown,
            child: const VideoChannelAndTitle(),
          ),
          AppSpaces.vSpace20,
          const VideoLikesAndComments(),
        ],
      ),
    );
  }
}
