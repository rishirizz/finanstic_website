import 'dart:ui';

import 'package:finanstic_website/constants/constants.dart';
import 'package:finanstic_website/pages/about_page.dart';
import 'package:flutter/material.dart';
import '../../components/text_styles.dart';
import '../../pages/service_page.dart';
import '../../refactored_widgets/about_content.dart';
import '../../refactored_widgets/about_heading.dart';
import '../footer/footer_mobile.dart';

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
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    HomePageMobile.routeName,
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
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isMenuOpened = false;
                        });
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AboutPage.routeName,
                          (Route route) => false,
                        );
                      },
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
              )
            : SingleChildScrollView(
                child: Column(
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
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 1.0,
                              sigmaY: 1.0,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                30,
                                0,
                                30,
                                20,
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
                                      Text(
                                        'FINANSTIC',
                                        style: headerTextStyleMobile(context),
                                      ),
                                      Text(
                                        'A simple and efficient expense tracking application that actually gets the job done.',
                                        style: primaryTextStyle(context),
                                        textAlign: TextAlign.center,
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
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          AboutHeading(heading: 'How can Finanstic help you?'),
                          SizedBox(
                            height: 20,
                          ),
                          AboutContent(
                            content: finansticDef,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
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
}
