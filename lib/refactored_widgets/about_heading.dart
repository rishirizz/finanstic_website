import 'package:flutter/material.dart';

import '../components/text_styles.dart';

class AboutHeading extends StatelessWidget {
  final String heading;

  const AboutHeading({
    required this.heading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: h2TextStyle(
        context,
      ),
    );
  }
}
