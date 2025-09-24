import 'package:flutter/cupertino.dart';
import 'package:squashwebsite/ui/common/shared_styles.dart';

class AcademyIcon extends StatelessWidget {
  const AcademyIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'FilledStacks Academy',
      style: ktsBodyRegular.copyWith(fontWeight: FontWeight.w800),
    );
  }
}