import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/video_screen_cubit/video_screen_cubit.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/video_screen_cubit/video_screen_cubit_states.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/comments_screen/comments_screen.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/video_widget/video_widget.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_colors.dart';
import 'package:reddit_clone/infrastructure/extensions/dimension_extension.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => VideoScreenCubit()..onInitVideoScreen(),
        child: BlocBuilder<VideoScreenCubit, VideoScreenCubitStates>(
          builder: (context, state) {
            VideoScreenCubit videoScreenCubit =
                VideoScreenCubit.ofCurrentContext(context);
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: context.height,
                  backgroundColor: AppColors.blackColor,
                  flexibleSpace: FlexibleSpaceBar(
                    background: MouseRegion(
                      onHover: (event) =>
                          videoScreenCubit.showVideoDataContainer(),
                      child: const VideoWidget(),
                    ),
                  ),
                ),
                const SliverFillRemaining(
                  hasScrollBody: true,
                  fillOverscroll: false,
                  child: CommentsScreen(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
