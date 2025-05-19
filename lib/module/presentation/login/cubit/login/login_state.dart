import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  final List<String> instructions;
  const LoginState({this.instructions = const []});

  LoginState copyWith({List<String>? instructions});

  @override
  List<Object?> get props => [instructions];
}

class LoginInitialState extends LoginState {
  const LoginInitialState({super.instructions = const []});

  @override
  LoginState copyWith({List<String>? instructions}) {
    return LoginInitialState(instructions: instructions ?? this.instructions);
  }
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState({super.instructions = const []});

  @override
  LoginState copyWith({List<String>? instructions}) {
    return LoginLoadingState(instructions: instructions ?? this.instructions);
  }
}

class LoginLoadedState extends LoginState {
  const LoginLoadedState({super.instructions = const []});

  @override
  LoginState copyWith({List<String>? instructions}) {
    return LoginLoadedState(instructions: instructions ?? this.instructions);
  }
}

class LoginErrorState extends LoginState {
  final String message;
  const LoginErrorState({this.message = 'Invalid email password', super.instructions = const []});

  @override
  List<Object?> get props => [message, instructions];

  @override
  LoginState copyWith({List<String>? instructions}) {
    return LoginErrorState(
      message: message,
      instructions: instructions ?? this.instructions,
    );
  }
}
