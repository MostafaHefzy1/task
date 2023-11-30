import 'package:flutter_application_1/core/handling_flutter_imports/handling_flutter_imports_screen.dart';

class SelectSourceImageWidget extends StatelessWidget {
  final String text;
  final Function function;

  const SelectSourceImageWidget(
      {super.key, required this.text, required this.function});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          children: [
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: AppColors.greyColor),
            ),
            const Spacer(),
            Icon(
              Icons.image,
              color: AppColors.primaryColor,
              size: 20.sp,
            )
          ],
        ),
      ),
    );
  }
}
