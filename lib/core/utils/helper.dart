
import '../handling_flutter_imports/handling_flutter_imports_screen.dart';

class MyHelper {
  static questionCustomDiaolg({
    required BuildContext context,
    required String title,
    required String btnOk,
    required String btnCancel,
    required Function btnOkOnPress,
  }) async {
    AwesomeDialog(
        context: context,
        animType: AnimType.rightSlide,
        title: title,
        btnOkColor: AppColors.primaryColor,
        btnCancelColor: AppColors.redColor,
        btnCancelText: btnCancel,
        btnCancelOnPress: () {},
        btnOkText: btnOk,
        btnOkOnPress: () {
          btnOkOnPress();
        }).show();
  }

  static void showSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.redColor,
        content: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: AppColors.whiteColor),
        ),
      ),
    );
  }

  static getImageByTwoOption(
      {required BuildContext context,
      required String textOne,
      required String textTwo,
      required Function functionOne,
      required Function functionTwo}) {
    AwesomeDialog(
        animType: AnimType.topSlide,
        dialogType: DialogType.noHeader,
        context: context,
        body: Column(
          children: [
            SelectSourceImageWidget(text: textOne, function: functionOne),
            const Divider(
              color: AppColors.lightGreyColor,
            ),
            SelectSourceImageWidget(text: textTwo, function: functionTwo)
          ],
        )).show();
  }
}
