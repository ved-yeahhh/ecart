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
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.vertical,
            ),
            child: IntrinsicHeight(
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthAuthenticated) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.pushReplacementNamed(context, "/homepage");
                    });
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

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 50),

                      // Email
                      CustomTextField(
                        label: "Email",
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 24),

                      // Password
                      CustomTextField(
                        label: "Password",
                        controller: passwordController,
                        isPassword: true,
                      ),
                      const SizedBox(height: 52),

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
                      const SizedBox(height: 14),

                      // OR text
                      const Text(
                        "OR",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 14),
                      SignInButton(
                        Buttons.google,
                        text: "Sign in with google",
                        onPressed: () {
                          context
                              .read<AuthBloc>()
                              .add(SignInWithGoogleRequested());
                        },
                      ),
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
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
