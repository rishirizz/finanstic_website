import 'dart:ui';

import 'package:finanstic_website/pages/about_page.dart';
import 'package:finanstic_website/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../../components/text_styles.dart';
import '../../constants/constants.dart';
import '../../pages/service_page.dart';
import '../../refactored_widgets/about_content.dart';
import '../../refactored_widgets/about_heading.dart';
import '../footer/footer_mobile.dart';

class ServicesPageMobile extends StatefulWidget {
  const ServicesPageMobile({super.key});
  static const routeName = '/services-mobile';

  @override
  State<ServicesPageMobile> createState() => _ServicesPageMobileState();
}

class _ServicesPageMobileState extends State<ServicesPageMobile>
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
                    Text(
                      'Services',
                      style: headerTextStyleMobile(context).copyWith(
                        color: Colors.black,
                        fontSize: 40 * getTextScaleFactor(context),
                        decoration: TextDecoration.underline,
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
                          height: 320,
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
                            sigmaX: 2.0,
                            sigmaY: 2.0,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20.0,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(136, 198, 198, 198),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'App Features',
                                  style: headerTextStyleMobile(context),
                                ),
                              ),
                            ),
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
                                fontSize: 40 * getTextScaleFactor(context),
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
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: appImages.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 2,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Image.asset(
                              appImages[index],
                            );
                          }),
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
