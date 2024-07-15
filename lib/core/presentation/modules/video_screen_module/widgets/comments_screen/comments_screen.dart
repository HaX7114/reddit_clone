import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/comments_screen/comments_screen_cubit/comments_screen_cubit.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/comments_screen/comments_screen_cubit/comments_screen_cubit_states.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/comments_screen/widgets/add_comment_widget.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/comments_screen/widgets/best_comments_title_widget.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/comments_screen/widgets/channel_title_widget.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/comments_screen/widgets/comment_widget/comment_widget.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/comments_screen/widgets/promotion_widget.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_border_radius.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_colors.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_spaces.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentsScreenCubit(),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.commentScreenBackgroundColor,
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    const ChannelTitleWidget(),
                    AppSpaces.vSpace10,
                    const PromotionWidget(),
                    AppSpaces.vSpace10,
                    const BestCommentsTitleWidget(),
                    AppSpaces.vSpace10,
                    BlocBuilder<CommentsScreenCubit, CommentsScreenCubitStates>(
                      builder: (context, state) => ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, commentsIndex) {
                          commentsIndex =
                              CommentsScreenCubit.ofCurrentContext(context)
                                      .comments
                                      .length -
                                  commentsIndex -
                                  1;
                          return Container(
                            color: AppColors.commentWidgetBackgroundColor,
                            child: ConditionalBuilder(
                              condition:
                                  CommentsScreenCubit.ofCurrentContext(context)
                                      .comments[commentsIndex]
                                      .replies
                                      .isNotEmpty,
                              builder: (context) => Column(
                                children: [
                                  CommentWidget(
                                    indexOfCurrentComment: commentsIndex,
                                    comment:
                                        CommentsScreenCubit.ofCurrentContext(
                                                context)
                                            .comments[commentsIndex],
                                  ),
                                  AppSpaces.vSpace10,
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      index =
                                          CommentsScreenCubit.ofCurrentContext(
                                                      context)
                                                  .comments[commentsIndex]
                                                  .replies
                                                  .length -
                                              1;
                                      return Container(
                                        color: AppColors
                                            .commentWidgetBackgroundColor,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: CommentWidget(
                                            indexOfCurrentComment:
                                                commentsIndex,
                                            comment: CommentsScreenCubit
                                                    .ofCurrentContext(context)
                                                .comments[commentsIndex]
                                                .replies[index],
                                            isReply: true,
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount:
                                        CommentsScreenCubit.ofCurrentContext(
                                                context)
                                            .comments[commentsIndex]
                                            .replies
                                            .length,
                                  ),
                                ],
                              ),
                              fallback: (context) => CommentWidget(
                                indexOfCurrentComment: commentsIndex,
                                comment: CommentsScreenCubit.ofCurrentContext(
                                        context)
                                    .comments[commentsIndex],
                              ),
                            ),
                          );
                        },
                        itemCount: CommentsScreenCubit.ofCurrentContext(context)
                            .comments
                            .length,
                        separatorBuilder: (context, index) =>
                            AppSpaces.vSpace10,
                      ),
                    ),
                    AppSpaces.vSpace50,
                    AppSpaces.vSpace20,
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  color: AppColors.commentScreenBackgroundColor,
                  height: 30,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 5,
                        width: 60,
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: AppCircularRadius.radius30,
                        ),
                      ),
                    ),
                  ),
                ),
                AppSpaces.expandedSpace,
                const AddCommentWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
