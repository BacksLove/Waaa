import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waaa/core/platform/network_info.dart';
import 'package:waaa/core/util/input_converter.dart';
import 'package:waaa/features/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:waaa/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:waaa/features/auth/domain/repositories/auth_repository.dart';
import 'package:waaa/features/auth/domain/use_cases/confirm_sign_up.dart';
import 'package:waaa/features/auth/domain/use_cases/fetch_current_user.dart';
import 'package:waaa/features/auth/domain/use_cases/log_out.dart';
import 'package:waaa/features/auth/domain/use_cases/login_with_email.dart';
import 'package:waaa/features/auth/domain/use_cases/sign_up_with_email.dart';
import 'package:waaa/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:waaa/features/hobbies/data/data_sources/hobbies_remote_data_source.dart';
import 'package:waaa/features/hobbies/data/repositories/hobbies_repository_impl.dart';
import 'package:waaa/features/hobbies/domain/repositories/hobbies_repository.dart';
import 'package:waaa/features/hobbies/domain/use_cases/get_hobbies.dart';
import 'package:waaa/features/users/presentation/manager/register_bloc.dart';

import 'features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'features/auth/presentation/manager/signup_bloc/signup_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Authentication
  // Bloc
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));
  sl.registerFactory<SignupBloc>(() => SignupBloc());
  sl.registerFactory<RegisterBloc>(() => RegisterBloc());
  sl.registerFactory<AuthBloc>(() => AuthBloc());

  // Use cases
  sl.registerLazySingleton<LoginWithEmail>(() => LoginWithEmail(sl()));
  sl.registerLazySingleton<LogOut>(() => LogOut(sl()));
  sl.registerLazySingleton<ConfirmSignUp>(() => ConfirmSignUp(sl()));
  sl.registerLazySingleton<SignUpWithEmail>(() => SignUpWithEmail(sl()));
  sl.registerLazySingleton<FetchCurrentUserAttributes>(
      () => FetchCurrentUserAttributes(sl()));
  sl.registerLazySingleton<GetHobbies>(() => GetHobbies(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<HobbiesRepository>(
      () => HobbiesRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
  sl.registerLazySingleton<HobbiesRemoteDataSource>(
      () => HobbiesRemoteDataSourceImpl());

  //! Core
  sl.registerLazySingleton<InputConverter>(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
