import 'package:flutter/material.dart';

import '../../components/text_styles.dart';
import '../../constants/constants.dart';
import '../../pages/home_page.dart';
import '../../pages/service_page.dart';
import '../services_page/services_page_mobile.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({super.key});

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
                      'assets/main_image.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'FINANSTIC',
                            style: headerTextStyleDesktop(context),
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
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'About',
                                style: primaryTextStyle(context).copyWith(
                                  fontSize: 25 * getTextScaleFactor(context),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
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
