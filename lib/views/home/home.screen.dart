import "package:animated_text_kit/animated_text_kit.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:lottie/lottie.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: context.height * (2.4 / 4),
              child: Lottie.asset(
                "lib/assets/anim/cat_alt.json",
                repeat: false,
                height: 300,
              ),
            ),
            Positioned(
              left: 0,
              top: 8,
              child: Lottie.asset(
                "lib/assets/anim/cat_paw.json",
                repeat: false,
                height: 120,
              ),
            ),
            Positioned(
              right: 0,
              top: 16,
              child: Lottie.asset(
                "lib/assets/anim/cat_paw.json",
                repeat: false,
                height: 120,
              ),
            ),
            Positioned(
              left: 24,
              right: 24,
              bottom: 0,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                width: context.width,
                height: context.height * (2.5 / 4),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Happy happy birthday to the most beautiful girl in the whole wide world \n\n Wish you best of luck, wishing you success in everything, wish you stay strong, healthy, and smart",
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  repeatForever: false,
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 0),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
