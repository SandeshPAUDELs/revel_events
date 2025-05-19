import 'package:equatable/equatable.dart';

class ToogleState extends Equatable {
  final bool isPasswordVisible;
  final bool isRememberMe;
  const ToogleState({
     this.isPasswordVisible = false,
     this.isRememberMe = false,
  });
  ToogleState copyWith({bool? isPasswordVisible, bool? isRememberMe}) {
    return ToogleState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isRememberMe: isRememberMe ?? this.isRememberMe,
    );
  }

  @override
  List<Object?> get props => [isPasswordVisible, isRememberMe];
}
