import 'package:finanstic_website/constants/constants.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  final Widget aboutPageMobile;
  final Widget aboutPageDesktop;

  static const routeName = '/about';

  const AboutPage(
      {required this.aboutPageMobile,
      required this.aboutPageDesktop,
      super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return widget.aboutPageDesktop;
        } else {
          return widget.aboutPageMobile;
        }
      },
    );
  }
}
