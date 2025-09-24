import 'package:ecart/common/custom_button.dart';
import 'package:ecart/common/custom_textfield.dart';
import 'package:ecart/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecart/feature/auth/presentation/bloc/auth_event.dart';
import 'package:ecart/feature/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.pushReplacementNamed(context, "/homepage");
          } else if (state is AuthUnauthenticated) {
            Navigator.pushReplacementNamed(context, "/login");
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * 0.3),

                  // Email
                  CustomTextField(
                    label: "Email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20.0),

                  // Password
                  CustomTextField(
                    label: "Password",
                    controller: passwordController,
                    isPassword: true,
                  ),
                  SizedBox(height: 50.0),

                  // Sign In Button
                  CustomButton(
                    text: "Sign In",
                    minWidth: width,
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            AuthSignInRequested(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            ),
                          );
                    },
                  ),
                  SizedBox(height: 25.0),

                  // OR text
                  const Text(
                    "OR",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 25.0),
                  SignInButton(
                    Buttons.google,
                    text: "Sign in with google",
                    onPressed: () {
                      context.read<AuthBloc>().add(SignInWithGoogleRequested());
                    },
                  ),
                  Spacer(),
                  // Sign Up link
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/signup");
                    },
                    child: const Text(
                      "Don't have an Account? Sign Up",
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
