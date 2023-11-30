

import '../handling_flutter_imports/handling_flutter_imports_screen.dart';

final sl = GetIt.instance;

Future<void> initGetIt() async {
  // Cubit
  sl.registerFactory(() => AuthCubit());
  sl.registerFactory(() => ImageCubit()..getImagesToFireStore());

  // sl.registerFactory(() => CompanyCubit(companiesRepository: sl()));
  // sl.registerFactory(() => CatogeryCubit(catogeryRepository: sl()));
  // sl.registerFactory(() => CartCubit(cartRepository: sl()));
  // sl.registerFactory(() => SettingCubit(settingRepository: sl()));
  // sl.registerFactory(() => OfferCubit(offerRepository: sl()));
  // sl.registerFactory(() => NotificationCubit(notificationRepository: sl()));
  // sl.registerFactory(() => DetailsProductCubit(detailsProductRepository: sl()));

  // Repository

  // sl.registerLazySingleton(() => CompaniesRepository(companyWebServices: sl()));
  // sl.registerLazySingleton(() => CatogeryRepository(catogeryWebServices: sl()));
  // sl.registerLazySingleton(() => SettingRepository(settingWebServices: sl()));
  // sl.registerLazySingleton(() => OfferRepository(offerWebServices: sl()));
  // sl.registerLazySingleton(() => CartRepository(cartWebServices: sl()));

  // sl.registerLazySingleton(
  //     () => NotificationRepository(notficationWebServices: sl()));
  // sl.registerLazySingleton(
  //     () => DetailsProductRepository(detailsProductWebServices: sl()));

  // Web Services

  // sl.registerLazySingleton(() => CompanyWebServices());
  // sl.registerLazySingleton(() => CatogeryWebServices());
  // sl.registerLazySingleton(() => SettingWebServices());
  // sl.registerLazySingleton(() => OfferWebServices());
  // sl.registerLazySingleton(() => NotficationWebServices());
  // sl.registerLazySingleton(() => DetailsProductWebServices());
  // sl.registerLazySingleton(() => CartWebServices());
}
