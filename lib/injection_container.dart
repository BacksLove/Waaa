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
import 'package:waaa/features/events/data/data_sources/event_remote_datasource.dart';
import 'package:waaa/features/events/data/repositories/event_repository_impl.dart';
import 'package:waaa/features/events/domain/repositories/event_repository.dart';
import 'package:waaa/features/events/domain/use_cases/get_events_by_user_id.dart';
import 'package:waaa/features/events/domain/use_cases/get_waaa_events.dart';
import 'package:waaa/features/events/presentation/manager/bloc/create_event_bloc.dart';
import 'package:waaa/features/hobbies/data/data_sources/hobbies_remote_data_source.dart';
import 'package:waaa/features/hobbies/data/repositories/hobbies_repository_impl.dart';
import 'package:waaa/features/hobbies/domain/repositories/hobbies_repository.dart';
import 'package:waaa/features/hobbies/domain/use_cases/get_hobbies.dart';
import 'package:waaa/features/home/presentation/manager/home_bloc/home_bloc.dart';
import 'package:waaa/features/users/data/data_sources/user_remote_datasource.dart';
import 'package:waaa/features/users/domain/repositories/user_repository.dart';
import 'package:waaa/features/users/domain/use_cases/create_user.dart';
import 'package:waaa/features/users/domain/use_cases/delete_user.dart';
import 'package:waaa/features/users/domain/use_cases/get_user_by_id.dart';
import 'package:waaa/features/users/domain/use_cases/update_user.dart';
import 'package:waaa/features/users/domain/use_cases/upload_user_photo.dart';
import 'package:waaa/features/users/presentation/manager/bloc/profile/profile_bloc.dart';
import 'package:waaa/features/users/presentation/manager/bloc/register/register_bloc.dart';

import 'features/auth/domain/use_cases/get_current_auth_user.dart';
import 'features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'features/auth/presentation/manager/signup_bloc/signup_bloc.dart';
import 'features/home/presentation/manager/navigation_cubit/bottom_navigation_cubit.dart';
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

  //! Feature - Users
  // Bloc
  sl.registerLazySingleton<ProfileBloc>(() => ProfileBloc());

  // Use cases
  sl.registerLazySingleton<UploadUserPhoto>(() => UploadUserPhoto(sl()));

  //! Feature - Home
  // Bloc
  sl.registerFactory<BottomNavigationCubit>(() => BottomNavigationCubit());
  sl.registerLazySingleton<HomeBloc>(() => HomeBloc(sl()));

  //! Events
  // Bloc
  sl.registerLazySingleton<CreateEventBloc>(() => CreateEventBloc());

  // Use cases
  sl.registerLazySingleton<GetEventsByUserId>(() => GetEventsByUserId(sl()));
  sl.registerLazySingleton<GetWaaaEvents>(() => GetWaaaEvents(sl()));

  // Repository
  sl.registerLazySingleton<EventRepository>(
      () => EventRepositoryImpl(sl(), sl()));

  // Data sources
  sl.registerLazySingleton<EventRemoteDatasource>(
      () => EventRemoteDatasourceImpl());

  //! Core
  sl.registerLazySingleton<InputConverter>(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
