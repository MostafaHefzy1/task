import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_color.dart';
import '../utils/default_component.dart';

class DisableContainer extends StatelessWidget {
  const DisableContainer({
    super.key,
    required this.text,
    required this.width,
  });

  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 42.h,
      decoration: const BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: DefaultComponent.defaultBorderRaduis),
      child: Center(
          child: Text(
        text,
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Colors.black,
            ),
      )),
    );
  }
}
