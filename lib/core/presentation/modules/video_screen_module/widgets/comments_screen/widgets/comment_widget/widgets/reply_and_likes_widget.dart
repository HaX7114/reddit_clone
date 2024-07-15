import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/comments_screen/comments_screen_cubit/comments_screen_cubit.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/comments_screen/widgets/comment_widget/comment_widget_cubit/comment_widget_cubit.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/comments_screen/widgets/comment_widget/comment_widget_cubit/comment_widget_cubit_states.dart';
import 'package:reddit_clone/core/presentation/shared_widgets/caption_text.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_colors.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_spaces.dart';

class ReplyAndLikesWidget extends StatelessWidget {
  final int indexOfCurrentComment;
  const ReplyAndLikesWidget({super.key, required this.indexOfCurrentComment});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentWidgetCubit, CommentWidgetCubitStates>(
      builder: (context, state) => Row(
        children: [
          AppSpaces.expandedSpace,
          const Icon(
            Icons.more_horiz,
            color: AppColors.lightGrey,
          ),
          AppSpaces.hSpace5,
          GestureDetector(
            onTap: () {
              CommentsScreenCubit.ofCurrentContext(context)
                  .focusNodeOnAddCommentTextField
                  .requestFocus();
              CommentsScreenCubit.ofCurrentContext(context)
                  .indexOfCommentToReply = indexOfCurrentComment;
            },
            child: const Row(
              children: [
                Icon(
                  Icons.reply_outlined,
                  color: AppColors.lightGrey,
                ),
                CaptionText(
                  text: 'Reply',
                  color: AppColors.lightGrey,
                ),
              ],
            ),
          ),
          AppSpaces.hSpace5,
          GestureDetector(
            onTap: () {
              CommentWidgetCubit.ofCurrentContext(context)
                  .handlingCommentLikesCounter();
            },
            child: Icon(
              Icons.arrow_upward_rounded,
              size: 25,
              color: CommentWidgetCubit.ofCurrentContext(context)
                      .likesCounterIsActive
                  ? AppColors.orangeColor
                  : AppColors.lightGrey,
            ),
          ),
          AppSpaces.hSpace5,
          CaptionText(
            text: CommentWidgetCubit.ofCurrentContext(context)
                .likesCounter
                .toString(),
            fontSize: 14,
            color: AppColors.lightGrey,
          ),
          AppSpaces.hSpace40,
          GestureDetector(
            onTap: () {
              CommentWidgetCubit.ofCurrentContext(context)
                  .handlingCommentDisLikesCounter();
            },
            child: Icon(
              Icons.arrow_downward_rounded,
              size: 25,
              color: CommentWidgetCubit.ofCurrentContext(context)
                      .dislikesCounterIsActive
                  ? AppColors.orangeColor
                  : AppColors.lightGrey,
            ),
          ),
        ],
      ),
    );
  }
}
