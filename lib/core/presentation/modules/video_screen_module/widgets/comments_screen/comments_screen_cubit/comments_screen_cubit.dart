import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/core/models/comment_model.dart';
import 'package:reddit_clone/core/models/user_model.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/comments_screen/comments_screen_cubit/comments_screen_cubit_states.dart';

class CommentsScreenCubit extends Cubit<CommentsScreenCubitStates> {
  CommentsScreenCubit() : super(CommentsScreenInitState());

  static CommentsScreenCubit ofCurrentContext(context) =>
      BlocProvider.of<CommentsScreenCubit>(context);

  TextEditingController addCommentController = TextEditingController();
  final focusNodeOnAddCommentTextField = FocusNode();
  int indexOfCommentToReply = -1;

  List<Comment> comments = [
    Comment(
      user: User(
          name: 'John Doe',
          imageUrl:
              'https://static-00.iconduck.com/assets.00/reddit-icon-1024x1024-hn49py6n.png'),
      text: 'This is a comment from John.',
      likes: 1,
      replies: [
        Comment(
          likes: 5,
          user: User(
              name: 'Jane Smith',
              imageUrl:
                  'https://static-00.iconduck.com/assets.00/reddit-icon-1024x1024-hn49py6n.png'),
          text: 'This is a reply from Jane.',
        ),
        Comment(
          user: User(
              name: 'Alice Johnson',
              imageUrl:
                  'https://static-00.iconduck.com/assets.00/reddit-icon-1024x1024-hn49py6n.png'),
          text: 'This is another reply from Alice.',
        ),
      ],
    ),
    Comment(
      likes: 6,
      user: User(
          name: 'Jane Smith',
          imageUrl:
              'https://static-00.iconduck.com/assets.00/reddit-icon-1024x1024-hn49py6n.png'),
      text: 'This is a comment from Jane.',
      replies: [
        Comment(
          user: User(
              name: 'John Doe',
              imageUrl:
                  'https://static-00.iconduck.com/assets.00/reddit-icon-1024x1024-hn49py6n.png'),
          text: 'This is a reply from John.',
        ),
      ],
    ),
    Comment(
      likes: 10,
      user: User(
          name: 'Alice Johnson',
          imageUrl:
              'https://static-00.iconduck.com/assets.00/reddit-icon-1024x1024-hn49py6n.png'),
      text: 'This is a comment from Alice.',
      replies: [],
    ),
  ];

  onChangeAddCommentTextField() {
    emit(OnChangeAddCommentTextFieldState());
  }

  onClickSendCommentButton() {
    if (indexOfCommentToReply != -1) {
      //TREAT IT AS A NEW COMMENT FOR A SPCEIFIC REPLY
      comments[indexOfCommentToReply].replies.add(
            Comment(
              date: 'Just now',
              user: User(
                  name: 'My username',
                  imageUrl:
                      'https://static-00.iconduck.com/assets.00/reddit-icon-1024x1024-hn49py6n.png'),
              text: addCommentController.text,
            ),
          );
    } else {
      //TREAT IT AS A NEW COMMENT
      comments.add(
        Comment(
          date: 'Just now',
          user: User(
              name: 'My username',
              imageUrl:
                  'https://static-00.iconduck.com/assets.00/reddit-icon-1024x1024-hn49py6n.png'),
          text: addCommentController.text,
        ),
      );
    }
    //RESET TO DEFAULT
    indexOfCommentToReply = -1;

    emit(OnClickSendCommentButtonState());
  }

  onClickSendCommentForReplyButton(
    int indexOfComment,
  ) {
    comments[indexOfComment].replies.add(
          Comment(
            date: 'Just now',
            user: User(
                name: 'My username',
                imageUrl:
                    'https://static-00.iconduck.com/assets.00/reddit-icon-1024x1024-hn49py6n.png'),
            text: addCommentController.text,
          ),
        );
    emit(OnClickSendCommentButtonState());
  }
}
