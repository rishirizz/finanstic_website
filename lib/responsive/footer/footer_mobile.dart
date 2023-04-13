import 'package:flutter/material.dart';

import '../../components/text_styles.dart';
import '../../constants/constants.dart';
import '../../pages/home_page.dart';

class FooterMobile extends StatefulWidget {
  const FooterMobile({super.key});

  @override
  State<FooterMobile> createState() => _FooterMobileState();
}

class _FooterMobileState extends State<FooterMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30.0,
          horizontal: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                footerQuote,
                style: footerTextStyle(context),
              ),
            ),
            FittedBox(
              child: Text(
                '— William Somerset Maugham',
                style: primaryTextStyle(context).copyWith(
                  color: Colors.white,
                  fontSize: 10 * getTextScaleFactor(context),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/youtube.png',
                  height: 60,
                  width: 60,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/youtube.png',
                  height: 60,
                  width: 60,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
