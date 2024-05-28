import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jasarumahku_new/home_screen.dart';
import 'package:jasarumahku_new/features/introduction/data/models/onboarding_items.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SmoothPageIndicator(
            controller: pageController,
            count: controller.items.length,
            onDotClicked: (index) => pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.ease),
            effect: const WormEffect(activeDotColor: Colors.red),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: isLastPage
            ? GetStarted()
            : TextButton(
                onPressed: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                child: Container(
                  width: 276,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xFFFF0000),
                      borderRadius: BorderRadius.circular(22)),
                  child: Center(
                    child: Text('Selanjutnya',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: PageView.builder(
              onPageChanged: (index) => setState(
                  () => isLastPage = controller.items.length - 1 == index),
              itemCount: controller.items.length,
              controller: pageController,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset('assets/img/onboarding/header.png'),
                        SizedBox(
                          height: 40,
                        ),
                        Image.asset(controller.items[index].image),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          controller.items[index].title,
                          style: GoogleFonts.poppins(
                              fontSize: 24,
                              color: Color(0xFFFD0404),
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          controller.items[index].description,
                          style: GoogleFonts.nunito(
                              fontSize: 15, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }

  Widget GetStarted() {
    return TextButton(
      onPressed: () async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool("onboarding", true);

        if (!mounted) return;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      child: Container(
        width: 276,
        height: 50,
        decoration: BoxDecoration(
            color: Color(0xFFFF0000), borderRadius: BorderRadius.circular(22)),
        child: Center(
          child: Text('Mulai',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
