import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/core/models/comment_model.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/widgets/comments_screen/widgets/comment_widget/comment_widget_cubit/comment_widget_cubit_states.dart';

class CommentWidgetCubit extends Cubit<CommentWidgetCubitStates> {
  CommentWidgetCubit() : super(CommentsWidgetInitState());

  static CommentWidgetCubit ofCurrentContext(context) =>
      BlocProvider.of<CommentWidgetCubit>(context);

  bool commentDataContainerIsShown = true;
  int likesCounter = 0;
  bool likesCounterIsActive = false;
  bool dislikesCounterIsActive = false;

  initCommentWidgetData(Comment comment) {
    likesCounter = comment.likes;
  }

  handlingCommentLikesCounter() {
    dislikesCounterIsActive = false;
    if (likesCounterIsActive) {
      likesCounterIsActive = false;
      likesCounter--;
    } else {
      likesCounterIsActive = true;
      likesCounter++;
    }

    emit(HandlingCommentLikesCounterWidgetState());
  }

  handlingCommentDisLikesCounter() {
    if (dislikesCounterIsActive) {
      dislikesCounterIsActive = false;
    } else {
      if (likesCounterIsActive) {
        likesCounterIsActive = false;
        likesCounter--;
      }
      dislikesCounterIsActive = true;
    }

    emit(HandlingCommentLikesCounterWidgetState());
  }
}
