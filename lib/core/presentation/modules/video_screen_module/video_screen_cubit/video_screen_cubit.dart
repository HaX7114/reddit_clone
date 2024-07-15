import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/core/presentation/modules/video_screen_module/video_screen_cubit/video_screen_cubit_states.dart';
import 'package:reddit_clone/core/presentation/themes/consts/app_colors.dart';
import 'package:video_player/video_player.dart';

class VideoScreenCubit extends Cubit<VideoScreenCubitStates> {
  VideoScreenCubit() : super(VideoScreenInitState());

  static VideoScreenCubit ofCurrentContext(context) =>
      BlocProvider.of<VideoScreenCubit>(context);

  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  bool videoDataContainerIsShown = true;
  int likesCounter = 899;
  bool likesCounterIsActive = false;
  bool dislikesCounterIsActive = false;

  onInitVideoScreen() {
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
    );

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: false,
      autoInitialize: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: AppColors.whiteColor,
        backgroundColor: AppColors.whiteColor,
        bufferedColor: AppColors.lightGrey,
        handleColor: AppColors.whiteColor,
      ),
    );
    hideVideoDataContainer();
  }

  handlingVideoLikesCounter() {
    dislikesCounterIsActive = false;
    if (likesCounterIsActive) {
      likesCounterIsActive = false;
      likesCounter--;
    } else {
      likesCounterIsActive = true;
      likesCounter++;
    }

    emit(HandlingVideoLikesCounterScreenState());
  }

  handlingVideoDisLikesCounter() {
    if (dislikesCounterIsActive) {
      dislikesCounterIsActive = false;
    } else {
      if (likesCounterIsActive) {
        likesCounterIsActive = false;
        likesCounter--;
      }
      dislikesCounterIsActive = true;
    }

    emit(HandlingVideoLikesCounterScreenState());
  }

  showVideoDataContainer() {
    videoDataContainerIsShown = true;
    emit(ShowVideoDataContainerScreenState());
    hideVideoDataContainer();
  }

  hideVideoDataContainer() async {
    await Future.delayed(const Duration(seconds: 3), () {
      videoDataContainerIsShown = false;
      emit(HideVideoDataContainerScreenState());
    });
  }

  void onDisposeVideoScreen() {
    videoPlayerController.dispose();
  }
}
