import 'dart:ui';

import 'package:finanstic_website/responsive/footer/footer_mobile.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../components/text_styles.dart';
import '../../constants/constants.dart';
import '../../pages/home_page.dart';
import '../../pages/service_page.dart';

class AboutPageMobile extends StatefulWidget {
  const AboutPageMobile({super.key});

  @override
  State<AboutPageMobile> createState() => _AboutPageMobileState();
}

class _AboutPageMobileState extends State<AboutPageMobile>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  bool isMenuOpened = false;
  AnimationController? animationController;
  Color textColorAbout = const Color(0xff707070);
  double textFontSizeAbout = 30;
  Color textColorServices = const Color(0xff707070);
  double textFontSizeServices = 30;
  TextDecoration aboutTextDecoration = TextDecoration.none;
  TextDecoration servicesTextDecoration = TextDecoration.none;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 450,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: appBarBackgrundColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    HomePage.routeName,
                    (Route route) => false,
                  );
                },
                child: Image.asset(
                  'assets/finanstic.png',
                  height: 30,
                  filterQuality: FilterQuality.high,
                ),
              ),
              IconButton(
                color: Colors.black,
                onPressed: () {
                  handleOnPressed();
                },
                icon: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  size: 30,
                  progress: animationController!,
                ),
              ),
            ],
          ),
        ),
        body: (isMenuOpened)
            ? Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/white.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'About',
                        style: headerTextStyleMobile(context).copyWith(
                          color: Colors.black,
                          fontSize: 40 * getTextScaleFactor(context),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isMenuOpened = false;
                          });
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            ServicesPage.routeName,
                            (Route route) => false,
                          );
                        },
                        child: Text(
                          'Services',
                          style: headerTextStyleMobile(context).copyWith(
                            color: textColorServices,
                            fontSize: textFontSizeServices *
                                getTextScaleFactor(context),
                            decoration: servicesTextDecoration,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 280,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/about1.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 1.0,
                              sigmaY: 1.0,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(137, 138, 138, 138),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          'Get ready to level up financially!',
                                          style: headerTextStyleMobile(context)
                                              .copyWith(
                                            fontSize: 28 *
                                                getTextScaleFactor(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              'There is no better time than now.',
                              style: h2TextStyle(context).copyWith(
                                decoration: TextDecoration.none,
                                fontSize: 40 * getTextScaleFactor(context),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              aboutPageContent,
                              style: paragraphTextStyle(context).copyWith(
                                fontSize: 22 * getTextScaleFactor(context),
                              ),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Text(
                              'Check out the App preview.',
                              style: h2TextStyle(context).copyWith(
                                decoration: TextDecoration.none,
                                fontSize: 40 * getTextScaleFactor(context),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 9 / 16,
                      child: VideoPlayer(
                        _controller,
                      ),
                    ),
                    const FooterMobile(),
                  ],
                ),
              ),
      ),
    );
  }

  void handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isMenuOpened = !isMenuOpened;
      isPlaying
          ? animationController!.forward()
          : animationController!.reverse();
    });
  }

  initializeVideoPlayer() {
    _controller = VideoPlayerController.asset(
      'assets/app_feature.mp4',
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
