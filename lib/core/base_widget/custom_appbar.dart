import '../handling_flutter_imports/handling_flutter_imports_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.title,
      this.iconBack = true,
      this.isTitle = true,
      this.signout = false});

  final String? title;
  final bool iconBack;
  final bool isTitle;
  final bool signout;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: iconBack
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.blackColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              })
          : signout
              ? IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.redColor,
                  ),
                  onPressed: () {
                    MyHelper.questionCustomDiaolg(
                        context: context,
                        title: "are you sure",
                        btnCancel: "cancel",
                        btnOk: "sure",
                        btnOkOnPress: () {
                          CacheHelper.removeData(
                            key: "documentId",
                          );
                          Navigator.pushNamedAndRemoveUntil(
                              context, Routes.loginScreen, (route) => false);
                        });
                  })
              : const SizedBox(),
      title: isTitle
          ? Text(title!, style: TextStyle(fontSize: 20.sp))
          : const SizedBox(),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(32.h);
}
