


import 'core/handling_flutter_imports/handling_flutter_imports_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
            providers: [
              BlocProvider(create: (BuildContext context) => sl<AuthCubit>()),
              BlocProvider(create: (BuildContext context) => sl<ImageCubit>()),
            ],
            child: MaterialApp(
              theme: appTheme,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: CacheHelper.getData(key: "documentId") != null
                  ? Routes.imageScreen
                  : Routes.loginScreen,
            ));
      },
    );
  }
}
