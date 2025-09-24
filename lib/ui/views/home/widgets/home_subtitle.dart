import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../common/shared_styles.dart';

class HomeSubtitle extends StatelessWidget {
  const HomeSubtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Build amazing software, the right way.',
          style: ktsBodyLarge.copyWith(fontWeight: FontWeight.w600),
        ),
        GradientText(
          ' Sign up to be notified',
          style: ktsBodyLarge.copyWith(fontWeight: FontWeight.w600),
          colors: const [Color(0xff0CFF60), Color(0xff0091FB)],
        )
      ],
    );
  }
}