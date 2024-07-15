import 'package:chewie/chewie.dart';
import 'package:flutter/widgets.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/video_screen_cubit/video_screen_cubit.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/video_widget/widgets/video_data_container.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Chewie(
            controller:
                VideoScreenCubit.ofCurrentContext(context).chewieController,
          ),
        ),
        const VideoDataContainer(),
      ],
    );
  }
}
