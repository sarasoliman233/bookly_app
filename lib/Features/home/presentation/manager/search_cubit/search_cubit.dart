import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../Core/utils/api_service.dart';
import '../../../data/models/BookModel.dart';

part 'search_state.dart';
class SearchCubit extends Cubit<SearchState> {
  final ApiService apiService;

  SearchCubit(this.apiService) : super(SearchInitial());

  Future<void> searchBooks(String query) async {
    emit(SearchLoading());
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=$query&orderBy=relevance&maxResults=20',
      );

      if (data['items'] == null) {
        emit(SearchEmpty());
        return;
      }

      final books = <BookModel>[];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      emit(SearchSuccess(books));
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }
}
