import 'package:event_app/module/data/secure_storage/secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  final SecureStorage _secureStorage;

  ImageCubit(this._secureStorage) : super(ImageInitialState());
  Future<void> loadImage() async {
    try {
      final imageUrl = await _secureStorage.readSecureData('my_image');
      if (imageUrl == null || imageUrl.isEmpty) {
        emit(ImageErrorState(message: 'No image URL found'));
      } else {
        emit(ImageLoadedState(imageUrl: imageUrl));
      }
    } catch (e) {
      emit(ImageErrorState(message: e.toString()));
    }
  }

  Future<void> saveImage(String url) async {
    try {
      await _secureStorage.writeSecureData('my_image', url);
      emit(ImageLoadedState(imageUrl: url));
    } catch (e) {
      emit(ImageErrorState(message: e.toString()));
    }
  }
}
