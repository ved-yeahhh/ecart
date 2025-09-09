import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/onboarding_page.dart';
import '../bloc/onboarding_bloc.dart';
import '../bloc/onboarding_event.dart';
import '../bloc/onboarding_state.dart';
import '../widgets/dotindicator.dart';

class OnboardingScreen extends StatelessWidget {
  final List<OnboardingPage> contents;

  const OnboardingScreen({super.key, required this.contents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (state.status == OnboardingStatus.completed) {
            Navigator.pushReplacementNamed(context, "/login");
          }
        },
        builder: (context, state) {
          final bloc = context.read<OnboardingBloc>();
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: contents.length,
                  onPageChanged: (index) {
                    bloc.add(PageChanged(index));
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(contents[index].image, height: 300),
                        const SizedBox(height: 20),
                        Text(
                          contents[index].title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          contents[index].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Bottom Buttons
              if (state.currentPage == contents.length - 1)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      height: 45.0,
                      minWidth: 150.0,
                      color: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        bloc.add(SignInPressed());
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 10),
                    MaterialButton(
                      height: 45.0,
                      minWidth: 150.0,
                      color: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        bloc.add(SignUpPressed());
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                )
              else
                Row(
                  children: [
                    ...List.generate(
                      contents.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Dotindicator(isActive: index == state.currentPage),
                      ),
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        bloc.add(NextPressed());
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
