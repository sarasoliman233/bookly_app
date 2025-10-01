import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:run_way/Core/utils/api_service.dart';
import 'package:run_way/Core/utils/service_locator.dart';
import 'package:run_way/Features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:run_way/Features/search/presentation/views/widgets/SearchViewBody.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SearchCubit(getIt.get<ApiService>()),
      child: Scaffold(
        body: SafeArea(
            child:
            SearchViewBody()),
      ),
    );
  }
}
