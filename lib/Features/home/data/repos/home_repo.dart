import 'package:dartz/dartz.dart';
import 'package:run_way/Features/home/data/models/BookModel.dart';

import '../../../../Core/errors/failures.dart';

abstract class HomeRepo{   //بعملها عشان احدد مثلا في الهوم احدد جواه ال هعمله بس مش بقول هعمله ازاي عشان كدا بستخدم abstrct class
 Future<Either<Failure,List<BookModel>>> fetchBestSellerBooks();
 Future<Either<Failure,List<BookModel>>>fetchFeaturedBooks();
 Future<Either<Failure,List<BookModel>>>fetchSimilarBooks({required String category});

}