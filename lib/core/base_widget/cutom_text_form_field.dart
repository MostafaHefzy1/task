import '../handling_flutter_imports/handling_flutter_imports_screen.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType keyBoardType;
  final String? initialValue;
  final String hintText;
  final bool obscureText;
  final Function? suffixFunction;
  final IconData? suffixIcon;
  final String? Function(String? val) validator;
  final TextEditingController textEditingController;
  final IconData? prefixIcon;
  final int? maxLines;
  final void Function(String)? onChanged;

  const CustomTextFormField(
      {Key? key,
      required this.obscureText,
      required this.validator,
      this.suffixFunction,
      this.suffixIcon,
      this.initialValue,
      required this.textEditingController,
      required this.hintText,
      this.prefixIcon,
      this.maxLines = 1,
      this.onChanged,
      required this.keyBoardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      initialValue: initialValue,
      onChanged: onChanged,
      keyboardType: keyBoardType,
      obscureText: obscureText,
      controller: textEditingController,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 5),
        border: const OutlineInputBorder(
          borderRadius: DefaultComponent.defaultBorderRaduis,
          borderSide: BorderSide(color: AppColors.greyColor),
        ),
        fillColor: Colors.white,
        prefixIconColor: AppColors.primaryColor,
        filled: true,
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon, color: AppColors.primaryColor),
                onPressed: () {
                  suffixFunction!();
                },
              )
            : null,
        enabledBorder: const OutlineInputBorder(
          borderRadius: DefaultComponent.defaultBorderRaduis,
          borderSide: BorderSide(color: AppColors.greyColor),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: DefaultComponent.defaultBorderRaduis,
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: DefaultComponent.defaultBorderRaduis,
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: DefaultComponent.defaultBorderRaduis,
          borderSide: BorderSide(color: AppColors.greyColor),
        ),
        hintText: hintText,
      ),
      validator: (value) {
        return validator(value);
      },
    );
  }
}
