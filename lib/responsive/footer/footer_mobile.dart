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
      height: 120,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // FittedBox(
          //   child: Text(
          //     footerQuote,
          //     style: footerTextStyle(context),
          //   ),
          // ),
          // FittedBox(
          //   child: Text(
          //     '— William Somerset Maugham',
          //     style: primaryTextStyle(context).copyWith(
          //       color: Colors.white,
          //       fontSize: 10 * getTextScaleFactor(context),
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          Text(
            'Let\'s connect',
            style: footerTextStyle(context),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  launchPlayStore();
                },
                child: Image.asset(
                  'assets/google_play.png',
                  height: 35,
                  width: 35,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              InkWell(
                onTap: () {
                  launchYoutube();
                },
                child: Image.asset(
                  'assets/youtube.png',
                  height: 40,
                  width: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  launchEmailURL();
                },
                icon: const Icon(
                  Icons.email,
                  size: 38,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            email,
            style: paragraphTextStyle(context).copyWith(
              color: Colors.white,
              fontSize: 10 * getTextScaleFactor(context),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
