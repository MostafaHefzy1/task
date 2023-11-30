import 'package:flutter_application_1/auth/presentation/login/widget/not_have_account_text.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../core/handling_flutter_imports/handling_flutter_imports_screen.dart';

class LoginScreen extends StatelessWidget {
  final emailControllerToSignin = TextEditingController();
  final passwordControllerToSignin = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            showLoadingIndicator(context);
          }
          if (state is LoginSuccessState) {
            Navigator.pop(context);
            CacheHelper.saveData(
                key: "documentId", value: state.userCredential.user!.uid);
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.imageScreen, (route) => false);
          }
          if (state is LoginFailedState) {
            Navigator.pop(context);
            MyHelper.showSnackBar(
                message: "Invalid Email Or Password", context: context);
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return WillPopScope(
            onWillPop: () async {
              return MyHelper.questionCustomDiaolg(
                  context: context,
                  title: "are you sure",
                  btnCancel: "cancel",
                  btnOk: "sure",
                  btnOkOnPress: () {
                    if (Platform.isAndroid) {
                      SystemNavigator.pop();
                    } else if (Platform.isIOS) {
                      exit(0);
                    }
                  });
            },
            child: Scaffold(
              body: Padding(
                padding: DefaultComponent.paddingToAuthation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            textEditingController: emailControllerToSignin,
                            keyBoardType: TextInputType.emailAddress,
                            prefixIcon: Icons.person,
                            hintText: "E-mail",
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'This field is required'),
                              EmailValidator(
                                  errorText: "The email format is incorrect")
                            ]),
                            obscureText: false,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          CustomTextFormField(
                            prefixIcon: Icons.lock,
                            textEditingController: passwordControllerToSignin,
                            keyBoardType: TextInputType.visiblePassword,
                            hintText: "password",
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'This field is required'),
                              MinLengthValidator(8,
                                  errorText: "Enter password Validation"),
                            ]),
                            suffixIcon: cubit.suffix,
                            obscureText: cubit.isShow,
                            suffixFunction: () => cubit.isShowAndHidePassWord(),
                          ),
                          SizedBox(height: AppSize.s30),
                          CustomButton(
                            widthButton: double.infinity,
                            textButton: "SignIn",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.loginUsingFirebase(
                                    email: emailControllerToSignin.text.trim(),
                                    password: passwordControllerToSignin.text);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSize.s10),
                    const NotHaveAccountTextWidget(),
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
