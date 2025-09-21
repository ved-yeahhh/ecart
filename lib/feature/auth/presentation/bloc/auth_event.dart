import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class AuthSignInRequested extends AuthEvent {
  final String email;
  final String password;

  AuthSignInRequested(this.email, this.password);

  @override
  List<Object?> get props => [email,password];
}

class SignInWithGoogleRequested extends AuthEvent{

}
