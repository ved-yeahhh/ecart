import 'package:ecart/feature/auth/presentation/bloc/auth_event.dart';
import 'package:ecart/feature/auth/presentation/bloc/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth auth;
  AuthBloc({required this.auth}) : super(AuthInitial()) {
    on<AuthSignInRequested>(_onsignInRequested);
  }

  Future<void> _onsignInRequested(
      AuthSignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final userCred = await auth.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(AuthAuthenticated(userCred.user!.uid));
    } catch (e) {
      emit(AuthUnauthenticated());
      emit(AuthError(e.toString()));
    }
  }
}
