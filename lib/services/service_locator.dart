import 'package:dozan/bloc/offers/offers_bloc.dart';
import 'package:dozan/services/HomeRepository.dart';
import 'package:get_it/get_it.dart';
import 'package:dozan/bloc/home_bloc/home_bloc.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // سجل المستودع (Repository) أولاً
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());

  // سجل الـ Bloc مع حقن المستودع
  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(homeRepository: getIt<HomeRepository>()),
  );
}

// offer page getter
void setupDI() {
  getIt.registerLazySingleton<OffersBloc>(() => OffersBloc());
}
