import '../entities/onboarding_page.dart';

class GetOnboardingPages {
  List<OnboardingPage> call() {
    return [
      OnboardingPage(
        image: "assets/images/onboarding_img1.jpg",
        title: "Welcome to E-Cart",
        description: "Your one-stop shop for everything!",
      ),
      OnboardingPage(
        image: "assets/images/onboarding_img3.jpg",
        title: "Discover Amazing Products",
        description: "Find products you'll love at unbeatable prices.",
      ),
      OnboardingPage(
        image: "assets/images/onboarding_img2.jpg",
        title: "Fast and Secure Checkout",
        description:
            "Enjoy quick checkout, multiple payment options, and reliable delivery right to your doorstep.",
      ),
      OnboardingPage(
        image: "assets/images/onboarding_img4.png",
        title: "Dive into World of Convenience",
        description:
            "Experience seamless shopping with personalized recommendations and 24/7 customer support.",
      ),
    ];
  }
}
