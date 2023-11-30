

import 'core/handling_flutter_imports/handling_flutter_imports_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  initGetIt();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
