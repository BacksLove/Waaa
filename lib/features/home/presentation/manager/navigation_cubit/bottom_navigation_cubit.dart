import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(const BottomNavigationState(currentPage: 0));

  void moveToTab(int page) {
    emit(state.copyWith(currentPage: page));
  }
}
