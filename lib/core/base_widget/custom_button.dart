// ignore_for_file: deprecated_member_use


import '../handling_flutter_imports/handling_flutter_imports_screen.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final Color textColor;
  final Function onPressed;
  final Color colorButton;
  final Color colorSideButton;

  final double widthButton;

  const CustomButton(
      {Key? key,
      this.widthButton = 40,
      required this.textButton,
      this.colorSideButton = AppColors.primaryColor,
      required this.onPressed,
      this.colorButton = AppColors.primaryColor,
      this.textColor = AppColors.whiteColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: colorButton,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: colorSideButton, width: 1.4),
            borderRadius: DefaultComponent.defaultBorderRaduis),
        minimumSize: Size(widthButton, 42.h),
      ),
      child: Text(
        textButton,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headline3?.copyWith(
              color: textColor,
            ),
      ),
    );
  }
}