import "dart:math";

import "package:flutter/material.dart";
import "package:flutter_card_swiper/flutter_card_swiper.dart";
import "package:get/get.dart";
import "package:just_audio/just_audio.dart";
import "package:mk_bd/data/mockdata.dart";

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> with WidgetsBindingObserver {
  final ValueNotifier _currentIndexNotifier = ValueNotifier(0);
  final CardSwiperController _cardController = CardSwiperController();

  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _initAudio();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _destoryAudio();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _pauseAudio();
    } else if (state == AppLifecycleState.resumed) {
      _playAudio();
    } else {}
  }

  void _initAudio() async {
    await player.setAsset("lib/assets/audio/song.mp3");
    player.setLoopMode(LoopMode.all);
    player.play();
    setState(() {});
  }

  void _destoryAudio() async {
    player.stop();
  }

  void _playAudio() async {
    player.play();
  }

  void _pauseAudio() async {
    player.pause();
  }

  void _stopAudio() async {
    player.seek(Duration.zero);
    player.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "❤️ Gallery ❤️",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      body: Stack(
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
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: CardSwiper(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              controller: _cardController,
              cardsCount: MockData.galleries.length,
              scale: 0.6,
              maxAngle: 50,
              cardBuilder: (context, index, percentThresholdX, percentThresholdY) => Center(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 4,
                      color: Colors.white,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      MockData.galleries[index].path,
                    ),
                  ),
                ),
              ),
              onUndo: (oldIndex, newIndex, direction) {
                _currentIndexNotifier.value = newIndex;
                return true;
              },
              onSwipe: (oldIndex, newIndex, direction) {
                _currentIndexNotifier.value = newIndex;
                return true;
              },
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 8,
            child: Center(
              child: Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: _currentIndexNotifier,
                    builder: (_, value, __) {
                      final text = MockData.galleries[value].text;

                      return AnimatedSize(
                        duration: const Duration(milliseconds: 200),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: text == null ? 0 : null,
                          margin: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            boxShadow: [
                              BoxShadow(
                                color: text == null ? Colors.transparent : Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 4),
                                blurRadius: 4,
                                spreadRadius: 1.5,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            MockData.galleries[value].text ?? "",
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: _currentIndexNotifier,
                    builder: (_, value, __) {
                      return Text(
                        "${value + 1}/${MockData.galleries.length}",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: Colors.white),
                      );
                    },
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (player.playing) {
                            _pauseAudio();
                          } else {
                            _playAudio();
                          }
                          setState(() {});
                        },
                        icon: Icon(player.playing ? Icons.pause : Icons.play_arrow, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {
                          _stopAudio();
                          setState(() {});
                        },
                        icon: const Icon(Icons.stop, color: Colors.white),
                      ),
                      // const Spacer(),
                      IconButton(
                        onPressed: () {
                          _cardController.undo();
                        },
                        icon: const Icon(Icons.arrow_left_rounded, color: Colors.white),
                      ),
                      const Spacer(),
                      Text(
                        "Swipe or use arrows",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          final num = Random().nextInt(4) + 1;
                          switch (num) {
                            case 1:
                              return _cardController.swipeLeft();
                            case 2:
                              return _cardController.swipeRight();
                            case 3:
                              return _cardController.swipeTop();
                            case 4:
                              return _cardController.swipeBottom();
                            default:
                              return _cardController.swipe();
                          }
                        },
                        icon: const Icon(Icons.arrow_right_rounded, color: Colors.white),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
