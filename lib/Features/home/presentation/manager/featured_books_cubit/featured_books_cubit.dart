import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:run_way/Features/home/data/models/BookModel.dart';
import 'package:run_way/Features/home/data/repos/home_repo.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void>fetchFeaturedBooks()async{
    emit(FeaturedBooksLoading());
  var result= await homeRepo.fetchFeaturedBooks();
  result.fold(
      (failure){
        emit(FeaturedBooksFailure(failure.errorMessage));
      },
      (books){
        emit(FeaturedBookSuccess(books));
      });
  }
}
