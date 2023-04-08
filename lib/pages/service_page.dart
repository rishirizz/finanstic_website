import 'package:finanstic_website/constants/constants.dart';
import 'package:flutter/material.dart';

class ServicesPage extends StatefulWidget {
  final Widget servicePageDesktop;
  final Widget servicesPageMobile;

  static const routeName = '/services';

  const ServicesPage(
      {required this.servicePageDesktop,
      required this.servicesPageMobile,
      super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return widget.servicePageDesktop;
        } else {
          return widget.servicesPageMobile;
        }
      },
    );
  }
}
