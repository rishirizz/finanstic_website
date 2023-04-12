import 'package:flutter/material.dart';

import '../../components/text_styles.dart';
import '../../constants/constants.dart';
import '../../pages/home_page.dart';

class FooterDesktop extends StatefulWidget {
  const FooterDesktop({super.key});

  @override
  State<FooterDesktop> createState() => _FooterDesktopState();
}

class _FooterDesktopState extends State<FooterDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30.0,
          horizontal: 50,
        ),
        child: Row(
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
                'assets/finanstic_app_icon.png',
                height: 100,
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  footerQuote,
                  style: footerTextStyle(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '— William Somerset Maugham',
                      style: primaryTextStyle(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
