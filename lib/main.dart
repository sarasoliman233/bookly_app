import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:run_way/Core/utils/AppRouter.dart';
import 'package:run_way/Core/utils/service_locator.dart';
import 'package:run_way/Features/home/data/repos/home-repo_impl.dart';
import 'package:run_way/Features/home/presentation/manager/best_seller_books/best_seller_cubit.dart';
import 'package:run_way/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:run_way/constants.dart';

void main() {
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context)=>
                FeaturedBooksCubit(getIt.get<HomeRepoImpl>())..fetchFeaturedBooks(),),

        BlocProvider(
            create: (context)=>
                BestSellerCubit(getIt.get<HomeRepoImpl>())..fetchBestSellerBooks()
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),

      ),
    );
  }
}

