import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:run_way/Core/utils/appText.dart';
import 'package:run_way/Core/widgets/CustomButton.dart';
import 'package:run_way/Features/home/data/models/BookModel.dart';
import 'package:run_way/Features/home/presentation/views/widgets/BookRating.dart';
import 'package:run_way/Features/home/presentation/views/widgets/FeaturedBooksListView.dart';

import 'BooksAction.dart';
import 'CustomBookDetailsAppBar.dart';
import 'SimilarBookslistView.dart';
import 'custom_book_item.dart';


class BookDetailsViewBody extends StatelessWidget {
   const BookDetailsViewBody({super.key, required this.bookModel});

   final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(

              children: [
                CustomBookDetailsAppBar(),
                const SizedBox(height: 33,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: width *0.25),
                  child: CustomBookItem(
                    imageUrl:
                   bookModel.volumeInfo?.imageLinks?.thumbnail ?? '',
                  ),
                ),
                const  SizedBox(height: 35,),
                AppText(
                  textAlign: TextAlign.center,
                    text:
                    bookModel.volumeInfo!.title!,
                    fontSize: 25, fontFamily: 'poppins',
                    fontWeight: FontWeight.w600),

                SizedBox(height: 9,),
                AppText(text:  bookModel.volumeInfo!.authors![0], fontSize: 18, fontFamily: 'fredoka', fontWeight: FontWeight.w400,color: Colors.white.withOpacity(0.7),fontStyle: FontStyle.italic,),
                SizedBox(height: 18,),
                BookRating(
                  mainAxisAlignment: MainAxisAlignment.center
                  ,  bookRating:bookModel.volumeInfo?.maturityRating ?? "N/A",
                  count: bookModel.volumeInfo?.pageCount ?? 0,
                ),
                const SizedBox(height: 34,),
                BooksAction(
                  bookModel: bookModel,
                ),
                Expanded(child: const SizedBox(height: 47,)),
                Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(text: 'You can also like', fontSize: 14, fontFamily: 'poppins', fontWeight: FontWeight.w600,)),
                const SizedBox(height: 15,),
                SimilarBooksListView(),
                const SizedBox(height: 40,),
              ],
            ),
          ),
        )
      ],
    );

  }
}
