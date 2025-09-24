import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:squashwebsite/ui/common/app_colors.dart';
import 'package:squashwebsite/ui/common/app_constants.dart';
import 'package:squashwebsite/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:squashwebsite/ui/views/home/widgets/home_image.dart';
import 'package:squashwebsite/ui/views/home/widgets/home_notify_button.dart';
import 'package:squashwebsite/ui/views/home/widgets/home_subtitle.dart';
import 'package:squashwebsite/ui/views/home/widgets/home_title.dart';
import 'package:stacked/stacked.dart';

import '../../common/academy_icon.dart';
import '../../common/input_field.dart';
import '../../common/shared_styles.dart';
import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Center(
        child: SizedBox(
          width: kdDesktopMaxContentWidth,
          height: kdDesktopMaxContentHeight,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AcademyIcon(),
                  const Spacer(flex: 2),
                  const HomeTitle(),
                  const HomeSubtitle(),

                  // Arrow
                  verticalSpaceMedium,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: SvgPicture.asset('assets/sign-up-arrow.svg'),
                  ),
                  verticalSpaceSmall,

                  Row(
                    children: const [
                      InputField(),
                      horizontalSpaceSmall,
                      HomeNotifyButton()
                    ],
                  ),
                  const Spacer(flex: 3)
                ],
              ),

              SizedBox(width: kdDesktopMaxContentWidth * 0.05),
              const HomeImage()
            ],
          ),
        ),
      )
    );
  }
}
