import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Footer extends StatefulWidget {
  final Widget footerPageMobile;
  final Widget footerPageDesktop;
  static const routeName = '/footer';

  const Footer(
      {required this.footerPageMobile,
      required this.footerPageDesktop,
      super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return widget.footerPageDesktop;
        } else {
          return widget.footerPageMobile;
        }
      },
    );
  }
}
