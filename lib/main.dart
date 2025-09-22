import 'package:ecart/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecart/feature/auth/presentation/bloc/auth_event.dart';
import 'package:ecart/feature/auth/presentation/pages/login_page.dart';
import 'package:ecart/feature/onboarding/data/datasources/onboarding_local_datasource.dart';
import 'package:ecart/feature/onboarding/data/repository/onboarding_repository_impl.dart';
import 'package:ecart/feature/onboarding/domain/repository/onboarding_repository.dart';
import 'package:ecart/feature/onboarding/domain/usecases/get_onboarding_page.dart';
import 'package:ecart/feature/onboarding/domain/usecases/save_onboarding_seen.dart';
import 'package:ecart/feature/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:ecart/feature/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:ecart/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GoogleSignIn.instance.initialize();
  final prefs = await SharedPreferences.getInstance();

  // Setup repository and usecases
  final localDataSource = OnboardingLocalDataSourceImpl(prefs: prefs);
  final OnboardingRepository repository =
      OnboardingRepositoryImpl(localDataSource);
  final saveOnboardingSeen = SaveOnboardingSeen(repository);

  // ✅ check if onboarding already seen
  final hasSeenOnboarding = await repository.isOnboardingSeen();
   FirebaseAuth auth = FirebaseAuth.instance ;
  runApp(BlocProvider(
    create: (context) => AuthBloc(auth: auth)..add(AppStarted()),
    child: MyApp(
      hasSeenOnboarding: hasSeenOnboarding,
      saveOnboardingSeen: saveOnboardingSeen,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final bool hasSeenOnboarding;
  final SaveOnboardingSeen saveOnboardingSeen;

  const MyApp({
    super.key,
    required this.hasSeenOnboarding,
    required this.saveOnboardingSeen,
  });

  @override
  Widget build(BuildContext context) {
    final pages = GetOnboardingPages()(); // list of onboarding contents

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Cart',
      theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: true),
      initialRoute: hasSeenOnboarding ? "/login" : "/onboarding",
      routes: {
        "/onboarding": (context) => BlocProvider(
              create: (_) => OnboardingBloc(
                totalPages: pages.length,
                saveOnboardingSeen: saveOnboardingSeen,
              ),
              child: OnboardingScreen(contents: pages),
            ),
        "/login": (context) => const LoginPage(),
        "/homepage": (context) =>  HomePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(child: Text("Homepage")),
    );
  }
}
