import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:run_way/Core/widgets/custom_error_widget.dart';
import 'package:run_way/Features/home/presentation/manager/best_seller_books/best_seller_cubit.dart';

import 'BestSellerListViewItem.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit,BestSellerState>(
      builder: (context,state){
     if (state is BestSellerSuccess) {
       return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: state.books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: BestSellerListViewItem(
                bookModel: state.books[index],
              ),
            );
          },
        );
     }else if(state is BestSellerFailure){
       return CustomErrorWidget(state.errorMessage);
     }else{
    return Center(child: CircularProgressIndicator(color: Colors.white,));
     }
      }
    );
  }}