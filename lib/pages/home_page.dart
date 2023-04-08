import 'package:finanstic_website/constants/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Widget homePageMobile;
  final Widget homePageDesktop;

  static const routeName = '/home';

  const HomePage(
      {required this.homePageMobile, required this.homePageDesktop, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return widget.homePageDesktop;
        } else {
          return widget.homePageMobile;
        }
      },
    );
  }
}
