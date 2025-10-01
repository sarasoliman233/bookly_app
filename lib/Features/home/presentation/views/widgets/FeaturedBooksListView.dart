import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:run_way/Core/widgets/custom_error_widget.dart';
import 'package:run_way/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(
      builder: (context,state){
      if (state is FeaturedBookSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height*0.3,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    GoRouter.of(context).push('/BookDetailsView',extra: state.books[index]);
                  },
                  child: CustomBookItem(
                  imageUrl:state.books[index].volumeInfo?.imageLinks?.thumbnail ?? '',

                  ),
                );
              }),
        );
      }else if(state is FeaturedBooksFailure){
        return CustomErrorWidget(state.errorMessage);
      }else{
        return Center(child: CircularProgressIndicator(color:Colors.white,));
      }
      },
    );
  }
}
