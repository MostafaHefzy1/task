

import '../handling_flutter_imports/handling_flutter_imports_screen.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitFoldingCube(
        color: AppColors.primaryColor,
      ),
    );
  }
}

void showLoadingIndicator(
  context,
) {
  showDialog(
      context: context,
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: LoadingIndicator(),
        );
      });
}
