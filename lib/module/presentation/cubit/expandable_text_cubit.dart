import 'package:flutter_bloc/flutter_bloc.dart';

class ExpandableTextCubit extends Cubit<bool> {
  ExpandableTextCubit() : super(false);

  void toggle() => emit(!state);
}
