import 'dart:io';

import 'package:finanstic_website/pages/service_page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../components/text_styles.dart';
import '../../constants/constants.dart';
import '../../pages/home_page.dart';
import '../../refactored_widgets/about_content.dart';
import '../../refactored_widgets/about_heading.dart';

class AboutPageDesktop extends StatefulWidget {
  const AboutPageDesktop({super.key});

  @override
  State<AboutPageDesktop> createState() => _AboutPageDesktopState();
}

class _AboutPageDesktopState extends State<AboutPageDesktop> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 500,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/about1.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        child: Text(
                          'Get ready to level up financially!',
                          style: headerTextStyleDesktop(context).copyWith(
                            fontSize: 60 * getTextScaleFactor(context),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 30,
                          right: 30,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              HomePage.routeName,
                            );
                          },
                          child: Image.asset(
                            'assets/finanstic.png',
                            height: 60,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 30,
                          left: 30,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'About',
                              style: primaryTextStyle(context).copyWith(
                                fontSize: 25 * getTextScaleFactor(context),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  ServicesPage.routeName,
                                );
                              },
                              child: Text(
                                'Services',
                                style: primaryTextStyle(context).copyWith(
                                  fontSize: 25 * getTextScaleFactor(context),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/white.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'There is no better time than now',
                                  style: h2TextStyle(context).copyWith(
                                    decoration: TextDecoration.none,
                                    fontSize: 36 * getTextScaleFactor(context),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  aboutPageContent,
                                  style: paragraphTextStyle(context).copyWith(
                                    fontSize: 26 * getTextScaleFactor(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(
                                _controller,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  initializeVideoPlayer() {
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    _controller.initialize().then(
          (value) => _controller.play(),
        );
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
