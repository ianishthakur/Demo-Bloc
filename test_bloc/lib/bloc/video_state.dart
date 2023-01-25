import 'package:equatable/equatable.dart';

abstract class VideoState extends Equatable {}

class VideoInitState extends VideoState{
  @override
  List<Object?> get props => [];

}


// Video Loading
class VideoLoading extends VideoState {
 
  @override
  List<Object?> get props => [];
}

//data sucess
class VideoFetchSucess extends VideoState {
  final List data;
  VideoFetchSucess({required this.data});
  @override
  List<Object?> get props => [];
}

//data fetch error
class VideoFetchError extends VideoState {
  final String errorMessage;
  VideoFetchError({required this.errorMessage});
  @override
  List<Object?> get props => [];
}
//data loadmore sucess

class VideoLoadmoreSucess extends VideoState {
  @override
  List<Object?> get props => [];
}

//data loadmore loading
class VideoLoadmoreLoading extends VideoState {
  @override
  List<Object?> get props => [];
}
