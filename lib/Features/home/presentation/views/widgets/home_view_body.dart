import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:run_way/Core/utils/appText.dart';
import 'BestSellerListView.dart';
import 'BestSellerListViewItem.dart';
import 'FeaturedBooksListView.dart';
import 'custom_app_bar.dart';
import 'custom_book_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                FeaturedBooksListView(),
                SizedBox(height: 52,),
                AppText(text: 'Best Seller', fontSize: 20, fontFamily: 'poppins',
                  fontWeight: FontWeight.w600,textAlign: TextAlign.start,),
                SizedBox(height: 20,),

              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BestSellerListView(),
          )
        )
      ],
    );
  }
}





