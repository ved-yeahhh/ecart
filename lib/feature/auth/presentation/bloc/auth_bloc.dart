import 'package:ecart/feature/auth/presentation/bloc/auth_event.dart';
import 'package:ecart/feature/auth/presentation/bloc/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth auth;
  AuthBloc({required this.auth}) : super(AuthInitial()) {
    on<AuthSignInRequested>(_onsignInRequested);
    on<SignInWithGoogleRequested>(_signInWithGoogle);
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

  Future<void> _signInWithGoogle(
      SignInWithGoogleRequested event, Emitter<AuthState> emit) async {
     emit(AuthLoading());
    try {
      final google = GoogleSignIn.instance;

      
      final account = await google.authenticate();
      // if (account == null) {
      //   emit(AuthUnauthenticated());
      //   return;
      // }

      final googleAuth = await account.authentication;
      final idToken = googleAuth.idToken;

      if (idToken == null) {
        emit(AuthError("Google idToken is null"));
        emit(AuthUnauthenticated());
        return;
      }

      final credential = GoogleAuthProvider.credential(idToken: idToken);
      final userCredential = await auth.signInWithCredential(credential);

      emit(AuthAuthenticated(userCredential.user!.uid));
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(AuthUnauthenticated());
    }
  }
}
