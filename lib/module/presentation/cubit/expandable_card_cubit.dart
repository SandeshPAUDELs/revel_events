import 'package:flutter_bloc/flutter_bloc.dart';

class ExpandCubit extends Cubit<List<bool>> {
  ExpandCubit() : super([]);

  void initializeList(int itemCount) {
    emit(List.generate(itemCount, (_) => false));
  }

  void toggleExpand(int index) {
    final newState = List<bool>.from(state);
    newState[index] = !newState[index];
    emit(newState);
  }
}
