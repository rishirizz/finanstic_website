import 'package:finanstic_website/pages/service_page.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 380,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/about.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'App Features',
                        style: headerTextStyleDesktop(context),
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
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'What we offer',
                            style: h2TextStyle(context).copyWith(
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: AboutHeading(
                            heading: 'Seamless Experience',
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        const Expanded(
                          flex: 2,
                          child: AboutHeading(
                            heading: 'Interactive Animations',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '',
                            style: h2TextStyle(context).copyWith(
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: AboutContent(
                            content: seamlessExperience,
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        const Expanded(
                          flex: 2,
                          child: AboutContent(
                            content: interactiveAnimations,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '',
                            style: h2TextStyle(context).copyWith(
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: AboutHeading(
                            heading: 'Security',
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        const Expanded(
                          flex: 2,
                          child: AboutHeading(
                            heading: 'Choosing Currency',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '',
                            style: h2TextStyle(context).copyWith(
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: AboutContent(
                            content: security,
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        const Expanded(
                          flex: 2,
                          child: AboutContent(
                            content: choosingCurrency,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Container(
                      color: Colors.white,
                      child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: appImages.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 600,
                            mainAxisExtent: 700,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Image.asset(
                              appImages[index],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
