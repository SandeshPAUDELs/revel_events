import 'package:equatable/equatable.dart';

abstract class ImageState extends Equatable {
  @override
  List<Object?> get props => [];
}
class ImageInitialState extends ImageState {
  @override
  List<Object?> get props => [];
}

class ImageLoadedState extends ImageState {
  final String imageUrl;

  ImageLoadedState({required this.imageUrl});

  @override
  List<Object?> get props => [imageUrl];
}
// class ImageLoadingState extends ImageState {
//   @override
//   List<Object?> get props => [];
// }

class ImageErrorState extends ImageState {
  final String message;

  ImageErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
