import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:run_way/Features/home/data/models/BookModel.dart';
import 'package:run_way/Features/home/presentation/views/widgets/custom_book_item.dart';
import '../../../../../Core/utils/appText.dart';
import 'BookRating.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push('/BookDetailsView',extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookItem(
                imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? '') ,
            SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: AppText(text:bookModel.volumeInfo?.title ?? "",
                      fontSize: 20, fontFamily: 'fredoka',
                      fontWeight: FontWeight.w400,maxLines: 2,overflow: TextOverflow.ellipsis,),
                  ),
                  const SizedBox(height: 3,),
                  AppText(
                    text: bookModel.volumeInfo?.authors != null && bookModel.volumeInfo!.authors!.isNotEmpty
                        ? bookModel.volumeInfo!.authors!.first
                        : "Unknown Author",
                    fontSize: 14, fontFamily: 'poppins', fontWeight: FontWeight.w600,color: Colors.grey,maxLines: 1,),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(text: 'Free', fontSize: 20, fontFamily: 'poppins', fontWeight: FontWeight.w800),
                      BookRating(
                        bookRating:bookModel.volumeInfo?.maturityRating ?? "N/A",
                        count: bookModel.volumeInfo?.pageCount ?? 0,
                        mainAxisAlignment: MainAxisAlignment.center,)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


