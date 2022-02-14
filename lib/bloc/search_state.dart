part of 'search_cubit.dart';

abstract class SearchCubitState extends Equatable {
  const SearchCubitState();

  @override
  List<Object> get props => [];
}

class SearchCubitInitial extends SearchCubitState {}

class SearchCubitLoading extends SearchCubitState {}

class SearchCubitLoaded extends SearchCubitState {
  final SearchResult results;

  const SearchCubitLoaded({required this.results});

  @override
  List<Object> get props => [results];
}

class SearchCubitError extends SearchCubitState {
  final String message;

  const SearchCubitError({required this.message});

  @override
  List<Object> get props => [message];
}
