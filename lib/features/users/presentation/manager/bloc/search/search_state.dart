// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

class SearchState extends Equatable {
  final SearchStatus status;
  final List<String> nationalities;
  final int minAge;
  final int maxAge;
  final List<User?>? users;

  const SearchState({
    required this.status,
    required this.nationalities,
    required this.minAge,
    required this.maxAge,
    this.users,
  });

  factory SearchState.initial() => const SearchState(
        status: SearchStatus.initial,
        nationalities: [],
        minAge: 18,
        maxAge: 72,
      );

  @override
  List<Object> get props {
    return [
      status,
      nationalities,
      minAge,
      maxAge,
    ];
  }

  SearchState copyWith({
    SearchStatus? status,
    List<String>? nationalities,
    int? minAge,
    int? maxAge,
    List<User?>? users,
  }) {
    return SearchState(
      status: status ?? this.status,
      nationalities: nationalities ?? this.nationalities,
      minAge: minAge ?? this.minAge,
      maxAge: maxAge ?? this.maxAge,
      users: users ?? this.users,
    );
  }
}
