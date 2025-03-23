import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';

import '../../../../constant/padding.dart';
import '../../../../theme/theme/theme_extensions/color_palette.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: null,
      centerTitle: true,
      leading: Utils.backButton(context),
      title: Text(
        title,
        style: textTheme.headlineSmall!.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
