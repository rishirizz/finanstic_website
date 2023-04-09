import 'package:finanstic_website/pages/about_page.dart';
import 'package:finanstic_website/pages/service_page.dart';
import 'package:finanstic_website/responsive/about_page/about-page_mobile.dart';
import 'package:finanstic_website/responsive/about_page/about_page_desktop.dart';
import 'package:finanstic_website/responsive/services_page/services_page_desktop.dart';
import 'package:finanstic_website/responsive/services_page/services_page_mobile.dart';
import 'package:finanstic_website/responsive/home_page/home_page_mobile.dart';
import 'package:finanstic_website/pages/home_page.dart';
import 'package:finanstic_website/responsive/home_page/home_page_desktop.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(
        homePageMobile: HomePageMobile(),
        homePageDesktop: HomePageDesktop(),
      ),
      onGenerateRoute: (RouteSettings settings) {
        debugPrint('build route for ${settings.name}');
        var routes = <String, WidgetBuilder>{
          HomePage.routeName: (BuildContext context) => const HomePage(
                homePageMobile: HomePageMobile(),
                homePageDesktop: HomePageDesktop(),
              ),
          ServicesPage.routeName: (BuildContext context) => const ServicesPage(
                servicesPageMobile: ServicesPageMobile(),
                servicePageDesktop: ServicesPageDesktop(),
              ),
          AboutPage.routeName: (BuildContext context) => const AboutPage(
                aboutPageMobile: AboutPageMobile(),
                aboutPageDesktop: AboutPageDesktop(),
              )
        };
        WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(
          builder: (ctx) => builder(ctx),
        );
      },
    );
  }
}
