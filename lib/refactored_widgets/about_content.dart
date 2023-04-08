import 'package:flutter/material.dart';

import '../components/text_styles.dart';

class AboutContent extends StatelessWidget {
  final String content;
  const AboutContent({
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: paragraphTextStyle(context),
    );
  }
}
