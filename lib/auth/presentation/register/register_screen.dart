import 'package:form_field_validator/form_field_validator.dart';
import '../../../core/handling_flutter_imports/handling_flutter_imports_screen.dart';

class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confrimPasswordController =
      TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            showLoadingIndicator(context);
          }
          if (state is RegisterSuccessState) {
            Navigator.pop(context);
            CacheHelper.saveData(
                key: "documentId", value: state.userCredential.user!.uid);

            Navigator.pushNamedAndRemoveUntil(
                context, Routes.imageScreen, (route) => false);
          }
          if (state is RegisterFailedState) {
            Navigator.pop(context);
            MyHelper.showSnackBar(
              message: "An error occurred, please try again later",
              context: context,
            );
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(
            appBar: const CustomAppBar(
              iconBack: true,
              isTitle: false,
            ),
            body: Form(
              key: formKey,
              child: Padding(
                padding: DefaultComponent.paddingToAuthation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppSize.s40,
                    ),
                    CustomTextFormField(
                      textEditingController: firstNameController,
                      keyBoardType: TextInputType.name,
                      hintText: "name",
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'This field is required'),
                      ]),
                      obscureText: false,
                    ),
                    SizedBox(
                      height: AppSize.s10,
                    ),
                    CustomTextFormField(
                      textEditingController: emailController,
                      keyBoardType: TextInputType.emailAddress,
                      hintText: "email",
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'This field is required'),
                        EmailValidator(
                            errorText: "The email format is incorrect")
                      ]),
                      obscureText: false,
                    ),
                    SizedBox(
                      height: AppSize.s10,
                    ),
                    CustomTextFormField(
                      textEditingController: passwordController,
                      keyBoardType: TextInputType.visiblePassword,
                      hintText: "password",
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'This field is required'),
                        MinLengthValidator(8,
                            errorText: "Enter password Validation"),
                      ]),
                      suffixIcon: cubit.suffix,
                      obscureText: cubit.isShow,
                      suffixFunction: () => cubit.isShowAndHidePassWord(),
                    ),
                    SizedBox(
                      height: AppSize.s10,
                    ),
                    CustomTextFormField(
                      textEditingController: confrimPasswordController,
                      keyBoardType: TextInputType.visiblePassword,
                      hintText: "Confirm Password",
                      validator: (val) => MatchValidator(
                        errorText: "Password Not Match",
                      ).validateMatch(passwordController.text,
                          confrimPasswordController.text),
                      suffixIcon: cubit.suffix,
                      obscureText: cubit.isShow,
                      suffixFunction: () => cubit.isShowAndHidePassWord(),
                    ),
                    SizedBox(
                      height: AppSize.s20,
                    ),
                    CustomButton(
                        widthButton: double.infinity,
                        textButton: "registration",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.registerUsingFirebase(
                              email: emailController.text,
                              name: firstNameController.text,
                              password: passwordController.text,
                            );
                          }
                        }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
