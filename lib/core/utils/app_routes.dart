

import '../handling_flutter_imports/handling_flutter_imports_screen.dart';

class Routes {
  static const String loginScreen = '/';
  static const String registerScreen = '/registerScreen';
  static const String imageScreen = '/imageScreen';
  static const String detailsImageScreen = '/detailsImageScreen';
}

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return pageRouteBuilder(screen: LoginScreen());
      case Routes.registerScreen:
        return pageRouteBuilder(screen: RegisterScreen());
      case Routes.imageScreen:
        return pageRouteBuilder(screen: const ImageScreen());
      case Routes.detailsImageScreen:
        final ImageItem imageItem = settings.arguments as ImageItem;
        return pageRouteBuilder(
            screen: DetailsImageScreen(
          imageItem: imageItem,
        ));
    }
    return null;
  }

  static PageRouteBuilder pageRouteBuilder({required Widget screen}) {
    return PageRouteBuilder(pageBuilder: (BuildContext context,
        Animation<double> animation, Animation<double> secondaryAnimation) {
      const begin = Offset(-1, 0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(position: animation.drive(tween), child: screen);
    });
  }
}
