import 'package:flutter_application_1/core/handling_flutter_imports/handling_flutter_imports_screen.dart';

class NotHaveAccountTextWidget extends StatelessWidget {
  const NotHaveAccountTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: RichText(
      text: TextSpan(
        text: "Don't have an account?",
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
        children: <TextSpan>[
          TextSpan(
            text: 'clickHere',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryColor,
                decorationStyle: TextDecorationStyle.solid),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, Routes.registerScreen);
              },
          )
        ],
      ),
    ));
  }
}
