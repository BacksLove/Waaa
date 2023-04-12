import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waaa/core/platform/network_info.dart';
import 'package:waaa/core/util/input_converter.dart';
import 'package:waaa/features/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:waaa/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:waaa/features/auth/domain/repositories/auth_repository.dart';
import 'package:waaa/features/auth/domain/use_cases/confirm_sign_up.dart';
import 'package:waaa/features/auth/domain/use_cases/get_current_auth_session.dart';
import 'package:waaa/features/auth/domain/use_cases/log_out.dart';
import 'package:waaa/features/auth/domain/use_cases/login_with_email.dart';
import 'package:waaa/features/auth/domain/use_cases/sign_up_with_email.dart';
import 'package:waaa/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:waaa/features/hobbies/data/data_sources/hobbies_remote_data_source.dart';
import 'package:waaa/features/hobbies/data/repositories/hobbies_repository_impl.dart';
import 'package:waaa/features/hobbies/domain/repositories/hobbies_repository.dart';
import 'package:waaa/features/hobbies/domain/use_cases/get_hobbies.dart';
import 'package:waaa/features/users/data/data_sources/user_remote_datasource.dart';
import 'package:waaa/features/users/domain/repositories/user_repository.dart';
import 'package:waaa/features/users/domain/use_cases/create_user.dart';
import 'package:waaa/features/users/domain/use_cases/delete_user.dart';
import 'package:waaa/features/users/domain/use_cases/get_user_by_id.dart';
import 'package:waaa/features/users/domain/use_cases/update_user.dart';
import 'package:waaa/features/users/presentation/manager/register_bloc.dart';

import 'features/auth/domain/use_cases/get_current_auth_user copy.dart';
import 'features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'features/auth/presentation/manager/signup_bloc/signup_bloc.dart';
import 'features/users/data/repositories/user_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Authentication
  // Bloc
  sl.registerLazySingleton<LoginBloc>(() => LoginBloc(sl()));
  sl.registerLazySingleton<SignupBloc>(() => SignupBloc(sl()));
  sl.registerLazySingleton<RegisterBloc>(() => RegisterBloc(sl()));
  sl.registerLazySingleton<AuthBloc>(() => AuthBloc());

  // Use cases
  sl.registerLazySingleton<LoginWithEmail>(() => LoginWithEmail(sl()));
  sl.registerLazySingleton<LogOut>(() => LogOut(sl()));
  sl.registerLazySingleton<ConfirmSignUp>(() => ConfirmSignUp(sl()));
  sl.registerLazySingleton<SignUpWithEmail>(() => SignUpWithEmail(sl()));
  sl.registerLazySingleton<GetCurrentAuthSession>(
      () => GetCurrentAuthSession(sl()));
  sl.registerLazySingleton<GetCurrentAuthUser>(() => GetCurrentAuthUser(sl()));
  sl.registerLazySingleton<GetHobbies>(() => GetHobbies(sl()));

  sl.registerLazySingleton<CreateUser>(() => CreateUser(sl()));
  sl.registerLazySingleton<GetUserById>(() => GetUserById(sl()));
  sl.registerLazySingleton<DeleteUser>(() => DeleteUser(sl()));
  sl.registerLazySingleton<UpdateUser>(() => UpdateUser(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<HobbiesRepository>(
      () => HobbiesRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
  sl.registerLazySingleton<HobbiesRemoteDataSource>(
      () => HobbiesRemoteDataSourceImpl());
  sl.registerLazySingleton<UserRemoteDatasource>(
      () => UserRemoteDatasourceImpl());

  //! Core
  sl.registerLazySingleton<InputConverter>(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
