import "package:animated_text_kit/animated_text_kit.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:lottie/lottie.dart";
import "package:mk_bd/data/mockdata.dart";

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final ValueNotifier<bool> _continueBtnNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 1,
                colors: [
                  Color(0xFFc38e70),
                  Color(0xFF774936),
                ],
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 32,
                      left: 0,
                      child: Lottie.asset(
                        "lib/assets/anim/cat_paw.json",
                        repeat: false,
                        height: 140,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 0,
                      right: 0,
                      child: Lottie.asset(
                        "lib/assets/anim/cat_alt.json",
                        repeat: false,
                        height: 200,
                      ),
                    ),
                    Positioned(
                      top: 32,
                      right: 0,
                      child: Lottie.asset(
                        "lib/assets/anim/cat_paw.json",
                        repeat: false,
                        height: 140,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 16, right: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            AnimatedTextKit(
                              animatedTexts: [
                                ...MockData.happyBirthdayMessages.map(
                                  (message) => TypewriterAnimatedText(
                                    message,
                                    textAlign: TextAlign.center,
                                    cursor: "",
                                    textStyle: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    speed: const Duration(milliseconds: 50),
                                  ),
                                ),
                              ],
                              repeatForever: false,
                              totalRepeatCount: 1,
                              pause: const Duration(seconds: 1),
                              displayFullTextOnTap: true,
                              stopPauseOnTap: true,
                              onFinished: () {
                                _continueBtnNotifier.value = true;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 0,
                      child: Lottie.asset(
                        "lib/assets/anim/ic_daisy.json",
                        repeat: false,
                        height: 180,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 0,
                      child: Lottie.asset(
                        "lib/assets/anim/ic_daisy.json",
                        repeat: false,
                        height: 180,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16),
            child: ValueListenableBuilder(
              valueListenable: _continueBtnNotifier,
              builder: (_, value, __) {
                return FilledButton.tonal(
                  onPressed: value ? () => Get.back() : null,
                  child: const Text("Go Back"),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
