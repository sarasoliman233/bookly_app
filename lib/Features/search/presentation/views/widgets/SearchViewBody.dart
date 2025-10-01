import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:run_way/Core/utils/appText.dart';
import 'package:run_way/Features/home/data/models/BookModel.dart';
import 'package:run_way/Features/home/presentation/manager/search_cubit/search_cubit.dart';

import '../../../../home/presentation/views/widgets/BestSellerListViewItem.dart';
import 'CustomSearchTextField.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CustomSearchTextField(),
          SizedBox(height: 30,),
      AppText(text: 'Search Result',
        fontSize: 22, fontFamily: 'fredoka',
        fontWeight: FontWeight.w500,color: Color(0xfff6d35e),),
          SizedBox(height: 15,),
          Expanded(
              child: SearchResultListView())
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: BestSellerListViewItem(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is SearchEmpty) {
          return const Center(child: Text('No results found.'));
        } else if (state is SearchFailure) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        } else {
          return const SizedBox(); // Initial state
        }
      },
    );
  }
}
