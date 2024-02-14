import 'package:bracket_buddy/app/widgets/text_widgets/body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../generated/assets.dart';

class CreateTournamentHeader extends StatelessWidget {
  final String headerTitle;
  const CreateTournamentHeader({super.key, this.headerTitle = "Create Tournament"});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.imagesBracketBuddyLogo,
          height: 50.h,
        ),
        Gap(20.h),
        BuddyBodyText(text: headerTitle),
      ],
    );
  }
}