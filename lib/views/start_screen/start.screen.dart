import "package:animated_text_kit/animated_text_kit.dart";
import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:mk_bd/navigation/router.dart";

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "You have got a mail",
                  textStyle: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 150),
                ),
              ],
              repeatForever: false,
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 250),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
            SizedBox(height: 16),
            Lottie.asset(
              "lib/assets/anim/mail_alt.json",
              repeat: true,
              height: 350,
              options: LottieOptions(),
            ),
            SizedBox(height: 16),
            FilledButton.tonal(
              onPressed: () {
                AppRouter.navigateToHomeScreen();
              },
              child: Text("Tap to continue"),
            ),
          ],
        ),
      ),
    );
  }
}
