import 'package:apple_music_clone/model/search_result.dart';
import 'package:apple_music_clone/services/search_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchCubitState> {
  SearchCubit() : super(SearchCubitInitial());

  Future search(String term) async {
    emit(SearchCubitLoading());
    try {
      SearchResult searchResult = await SearchServices.search(term);
      emit(SearchCubitLoaded(results: searchResult));
    } catch (e) {
      emit(SearchCubitError(message: e.toString()));
    }
  }

  void reInit() {
    emit(SearchCubitInitial());
  }
}
