// import 'package:equatable/equatable.dart';

// abstract class TextFieldsState extends Equatable {
//   final List<String> instructions;
//   const TextFieldsState({this.instructions = const []});
//   TextFieldsState copyWith({List<String>? instructions});

//   @override
//   // TODO: implement props
//   List<Object?> get props => [instructions];
// }

// class TextFieldsInitialState extends TextFieldsState {
//   const TextFieldsInitialState({super.instructions = const []});
//   @override
//   List<Object?> get props => [instructions];

//   @override
//   TextFieldsState copyWith({List<String>? instructions}) {
//     // TODO: implement copyWith
//     return TextFieldsInitialState(instructions: instructions ?? this.instructions);
//   }
// }

// class TextFieldsLoadingState extends TextFieldsState {
//   const TextFieldsLoadingState({super.instructions = const []});
//   @override
//   List<Object?> get props => [instructions];

//   @override
//   TextFieldsState copyWith({List<String>? instructions}) {
//     // TODO: implement copyWith
//     return TextFieldsLoadingState(instructions: instructions ?? this.instructions);
//   }
// }

// class TextFieldsLoadedState extends TextFieldsState {
//   const TextFieldsLoadedState({super.instructions = const []});
//   @override
//   List<Object?> get props => [instructions];

//   @override
//   TextFieldsState copyWith({List<String>? instructions}) {
//     // TODO: implement copyWith
//     return TextFieldsLoadedState(instructions: instructions ?? this.instructions);
//   }
// }

// class TextFieldsErrorState extends TextFieldsState {
//   final String message;
//   const TextFieldsErrorState({this.message = '', super.instructions = const []});
//   @override
//   List<Object?> get props => [message, instructions];

//   @override
//   TextFieldsState copyWith({List<String>? instructions}) {
//     return TextFieldsErrorState(
//       message: message,
//       instructions: instructions ?? this.instructions,
//     );
//   }
// }
import 'package:equatable/equatable.dart';

abstract class TextFieldsState extends Equatable {
  final List<String> instructions;
  const TextFieldsState({this.instructions = const []});

  TextFieldsState copyWith({List<String>? instructions});

  @override
  List<Object?> get props => [instructions];
}

class TextFieldsInitialState extends TextFieldsState {
  const TextFieldsInitialState({super.instructions = const []});

  @override
  TextFieldsState copyWith({List<String>? instructions}) {
    return TextFieldsInitialState(instructions: instructions ?? this.instructions);
  }
}

class TextFieldsLoadingState extends TextFieldsState {
  const TextFieldsLoadingState({super.instructions = const []});

  @override
  TextFieldsState copyWith({List<String>? instructions}) {
    return TextFieldsLoadingState(instructions: instructions ?? this.instructions);
  }
}

class TextFieldsLoadedState extends TextFieldsState {
  const TextFieldsLoadedState({super.instructions = const []});

  @override
  TextFieldsState copyWith({List<String>? instructions}) {
    return TextFieldsLoadedState(instructions: instructions ?? this.instructions);
  }
}

class TextFieldsErrorState extends TextFieldsState {
  final String message;
  const TextFieldsErrorState({this.message = 'Invalid email password', super.instructions = const []});

  @override
  List<Object?> get props => [message, instructions];

  @override
  TextFieldsState copyWith({List<String>? instructions}) {
    return TextFieldsErrorState(
      message: message,
      instructions: instructions ?? this.instructions,
    );
  }
}
