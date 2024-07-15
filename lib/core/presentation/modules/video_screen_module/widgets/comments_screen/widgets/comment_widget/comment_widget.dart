import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/core/models/comment_model.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/comments_screen/widgets/comment_widget/comment_widget_cubit/comment_widget_cubit.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/comments_screen/widgets/comment_widget/comment_widget_cubit/comment_widget_cubit_states.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/comments_screen/widgets/comment_widget/widgets/reply_and_likes_widget.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/comments_screen/widgets/comment_widget/widgets/userdata_and_date_widget.dart';
import 'package:reddit_clone/core/presentation/shared_widgets/caption_text.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_colors.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_spaces.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;
  final bool isReply;
  final int indexOfCurrentComment;
  const CommentWidget({
    super.key,
    required this.comment,
    required this.indexOfCurrentComment,
    this.isReply = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: UniqueKey(),
      create: (context) => CommentWidgetCubit()..initCommentWidgetData(comment),
      child: BlocBuilder<CommentWidgetCubit, CommentWidgetCubitStates>(
        builder: (context, state) => ConditionalBuilder(
          condition: isReply,
          builder: (context) => Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: AppColors.lightGrey,
                    width: 0.3,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserDataAndDateWidget(
                      userImage: comment.user.imageUrl,
                      username: comment.user.name,
                      date: comment.date,
                    ),
                    AppSpaces.vSpace10,
                    CaptionText(text: comment.text),
                    AppSpaces.vSpace10,
                    ReplyAndLikesWidget(
                      indexOfCurrentComment: indexOfCurrentComment,
                    ),
                  ],
                ),
              ),
            ),
          ),
          fallback: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserDataAndDateWidget(
                  userImage: comment.user.imageUrl,
                  username: comment.user.name,
                  date: comment.date,
                ),
                AppSpaces.vSpace10,
                CaptionText(text: comment.text),
                AppSpaces.vSpace10,
                ReplyAndLikesWidget(
                  indexOfCurrentComment: indexOfCurrentComment,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
