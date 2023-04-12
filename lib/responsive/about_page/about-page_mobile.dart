import 'dart:ui';

import 'package:flutter/material.dart';

import '../../components/text_styles.dart';
import '../../constants/constants.dart';
import '../../pages/home_page.dart';
import '../../pages/service_page.dart';
import '../../refactored_widgets/about_content.dart';
import '../../refactored_widgets/about_heading.dart';

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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: appBarBackgrundColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    HomePage.routeName,
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
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 250,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/laptop.jpg',
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
                          child: Text(
                            'App Features',
                            style: headerTextStyleMobile(context),
                          ),
                        ),
                      ],
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
                              'What we offer',
                              style: h2TextStyle(context).copyWith(
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            const AboutHeading(
                              heading: 'Seamless Experience',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const AboutContent(
                              content: seamlessExperience,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const AboutHeading(
                              heading: 'Interactive Animations',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const AboutContent(
                              content: interactiveAnimations,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const AboutHeading(
                              heading: 'Security',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const AboutContent(
                              content: security,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const AboutHeading(
                              heading: 'Choosing Currency',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const AboutContent(
                              content: choosingCurrency,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              color: Colors.white,
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: appImages.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1 / 2,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Image.asset(
                                      appImages[index],
                                    );
                                  }),
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

  void handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isMenuOpened = !isMenuOpened;
      isPlaying
          ? animationController!.forward()
          : animationController!.reverse();
    });
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
}
