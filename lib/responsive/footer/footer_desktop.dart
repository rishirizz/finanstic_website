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
      height: 200,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                const SizedBox(
                  height: 10,
                ),
                Text(
                  email,
                  style: paragraphTextStyle(context).copyWith(
                    color: Colors.white,
                    fontSize: 13 * getTextScaleFactor(context),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    footerQuote,
                    style: footerTextStyle(context).copyWith(
                      fontSize: 18 * getTextScaleFactor(context),
                    ),
                    softWrap: true,
                  ),
                ),
                Text(
                  '— William Somerset Maugham',
                  style: primaryTextStyle(context).copyWith(
                    color: Colors.white,
                    fontSize: 12 * getTextScaleFactor(context),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
