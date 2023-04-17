// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bottom_navigation_cubit.dart';

class BottomNavigationState extends Equatable {
  final int currentPage;

  const BottomNavigationState({required this.currentPage});

  @override
  List<Object?> get props => [currentPage];

  BottomNavigationState copyWith({
    int? currentPage,
  }) {
    return BottomNavigationState(
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
