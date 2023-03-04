import 'package:get_charge/core/network/network_info.dart';
import 'package:get_charge/data/datasources/local_datasources/local_token_datasources.dart';
import 'package:get_charge/data/datasources/remote_datasources/remote_profile_datasorces.dart';
import 'package:get_charge/data/datasources/remote_datasources/remote_token_datasources.dart';
import 'package:get_charge/data/repository/profile_repository_impl.dart';
import 'package:get_charge/data/repository/token_repository_impl.dart';
import 'package:get_charge/domain/repository/profile_repository.dart';
import 'package:get_charge/domain/repository/token_repository.dart';
import 'package:get_charge/domain/usecases/authorization_usecases.dart';
import 'package:get_charge/domain/usecases/profile_usecases.dart';
import 'package:get_charge/presentation/block/auth/auth_cubit.dart';
import 'package:get_charge/presentation/block/profile/profile_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC / Cubit
  sl.registerFactory(() => AuthCubit(getToken: sl(), refreshToken: sl()));
  sl.registerFactory(() => ProfileCubit(getProfile: sl()));

  // UseCases
  sl.registerLazySingleton(() => GetToken(tokenRepository: sl()));
  sl.registerLazySingleton(() => RefreshToken(tokenRepository: sl()));

  sl.registerLazySingleton(() => GetProfile(sl()));

  // Repository
  sl.registerLazySingleton<TokenRepository>(
    () => TokenRepositoryImpl(remoteTokenDataSources: sl(), localTokenDataSources: sl(), networkInfo: sl())
  );

  sl.registerLazySingleton<ProfileRepository>(
          () => ProfileRepositoryImpl(profileDataSources: sl(), networkInfo: sl())
  );

  // Data Source
  sl.registerLazySingleton<RemoteTokenDataSources>(() => RemoteTokenDataSourcesImpl());
  sl.registerLazySingleton<LocalTokenDataSources>(() => LocalTokenDataSourcesImpl());


  sl.registerLazySingleton<RemoteProfileDataSources>(() => RemoteProfileDataSourcesImpl());

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
