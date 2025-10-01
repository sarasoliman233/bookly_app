import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:run_way/Features/home/data/models/BookModel.dart';

import '../../../data/repos/home_repo.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this.homeRepo) : super(BestSellerInitial());
  final HomeRepo homeRepo;

  Future<void> fetchBestSellerBooks()async{
    emit(BestSellerLoading());
    var result= await homeRepo.fetchFeaturedBooks();
    result.fold(
            (failure){
          emit(BestSellerFailure(failure.errorMessage));
        },
            (books){
          emit(BestSellerSuccess(books));
        });
  }
}
