import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitState());

  fetchVideos() async {
    //Fetch Videos form server
    emit(VideoLoading());

    const url = "https://pixabay.com/api";

    try {
      final response = await Dio().get(url, queryParameters: {
        "key": "27717413-255dac3cb34fa86bca1a5055f",
        "q": "cars",
        "image_type": "photo"
      });
      final List hits = response.data["hits"];
      emit(VideoFetchSucess(data: hits));
    } catch (e) {
      emit(VideoFetchError(errorMessage: e.toString()));
    }
  }
}
