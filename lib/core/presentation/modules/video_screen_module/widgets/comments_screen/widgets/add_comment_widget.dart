import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/comments_screen/comments_screen_cubit/comments_screen_cubit.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/comments_screen/comments_screen_cubit/comments_screen_cubit_states.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_border_radius.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_colors.dart';

class AddCommentWidget extends StatelessWidget {
  const AddCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextField(
        controller:
            CommentsScreenCubit.ofCurrentContext(context).addCommentController,
        cursorColor: AppColors.whiteColor,
        style: const TextStyle(
          color: AppColors.whiteColor,
        ),
        onChanged: (value) {
          CommentsScreenCubit.ofCurrentContext(context)
              .onChangeAddCommentTextField();
        },
        focusNode: CommentsScreenCubit.ofCurrentContext(context)
            .focusNodeOnAddCommentTextField,
        decoration: InputDecoration(
          hintText: 'Add a comment',
          hintStyle: const TextStyle(
            color: AppColors.whiteColor,
          ),
          filled: true,
          fillColor: AppColors.addCommentBackgroundColor,
          border: OutlineInputBorder(
            borderRadius: AppCircularRadius.radius5,
            borderSide: BorderSide.none,
          ),
          suffixIcon:
              BlocBuilder<CommentsScreenCubit, CommentsScreenCubitStates>(
                  builder: (context, state) => ConditionalBuilder(
                        condition: CommentsScreenCubit.ofCurrentContext(context)
                            .addCommentController
                            .text
                            .isNotEmpty,
                        builder: (context) => IconButton(
                          icon: const Icon(
                            Icons.send,
                            color: AppColors.orangeColor,
                          ),
                          onPressed: () {
                            CommentsScreenCubit.ofCurrentContext(context)
                                .onClickSendCommentButton();
                          },
                        ),
                        fallback: (context) => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.emoji_emotions,
                                  color: Colors.grey),
                              onPressed: () {
                                // Handle smile emoji icon tap
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.gif, color: Colors.grey),
                              onPressed: () {
                                // Handle GIF icon tap
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.image, color: Colors.grey),
                              onPressed: () {
                                // Handle image icon tap
                              },
                            ),
                          ],
                        ),
                      )),
        ),
      ),
    );
  }
}
