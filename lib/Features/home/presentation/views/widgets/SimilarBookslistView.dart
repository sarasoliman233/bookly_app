import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:run_way/Core/widgets/custom_error_widget.dart';
import 'package:run_way/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';

import 'custom_book_item.dart' show CustomBookItem;

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
          if (state is SimilarBooksSuccess) {
            return SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.14,
              child: ListView.builder(
                itemCount: state.books.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CustomBookItem(
                      imageUrl:
                     state.books[index].volumeInfo?.imageLinks?.thumbnail ?? '',
                    );
                  }),
            );
          }else if(state is SimilarBooksFailure){
    return CustomErrorWidget(state.errMessage);
          }else{
            return Center(child: CircularProgressIndicator(color:Colors.white,));
          }
        }
    );
  }
}