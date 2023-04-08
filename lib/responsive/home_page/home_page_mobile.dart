import 'dart:ui';

import 'package:finanstic_website/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../components/text_styles.dart';
import '../../pages/service_page.dart';
import '../services_page/services_page_mobile.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key});

  static const routeName = '/home-mobile';

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  bool isPlaying = false;
  bool isMenuOpened = false;
  Color textColorAbout = const Color(0xff707070);
  double textFontSizeAbout = 30;
  Color textColorServices = const Color(0xff707070);
  double textFontSizeServices = 30;
  TextDecoration aboutTextDecoration = TextDecoration.none;
  TextDecoration servicesTextDecoration = TextDecoration.none;

  @override
  void initState() {
    super.initState();
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    HomePageMobile.routeName,
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
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MouseRegion(
                      onHover: _onHoverAbout,
                      onExit: _onExitAbout,
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'About',
                          style: headerTextStyleMobile(context).copyWith(
                            color: textColorAbout,
                            fontSize:
                                textFontSizeAbout * getTextScaleFactor(context),
                            decoration: aboutTextDecoration,
                          ),
                        ),
                      ),
                    ),
                    MouseRegion(
                      onHover: _onHoverServices,
                      onExit: _onExitServices,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isMenuOpened = false;
                          });
                          Navigator.pushNamed(
                            context,
                            ServicesPage.routeName,
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
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 300,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/main_image.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 1.0,
                            sigmaY: 1.0,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 60.0),
                            child: Column(
                              children: [
                                Text(
                                  'FINANSTIC',
                                  style: headerTextStyleMobile(context),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  child: Text(
                                    'A simple and efficient expense tracking application that actually gets the job done.',
                                    style: primaryTextStyle(context),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Center(child: Text('Sign up details')),
                  ],
                ),
              ),
      ),
    );
  }

  void _onHoverAbout(PointerEvent details) {
    setState(() {
      textColorAbout = Colors.black;
      textFontSizeAbout = 40 * getTextScaleFactor(context);
      aboutTextDecoration = TextDecoration.underline;
    });
  }

  void _onExitAbout(PointerEvent details) {
    setState(() {
      textColorAbout = const Color(0xff707070);
      textFontSizeAbout = 30 * getTextScaleFactor(context);
      aboutTextDecoration = TextDecoration.none;
    });
  }

  void _onHoverServices(PointerEvent details) {
    setState(() {
      textColorServices = Colors.black;
      textFontSizeServices = 40 * getTextScaleFactor(context);
      servicesTextDecoration = TextDecoration.underline;
    });
  }

  void _onExitServices(PointerEvent details) {
    setState(() {
      textColorServices = const Color(0xff707070);
      textFontSizeServices = 30 * getTextScaleFactor(context);
      servicesTextDecoration = TextDecoration.none;
    });
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
}
