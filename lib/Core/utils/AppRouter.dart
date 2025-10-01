import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:run_way/Core/utils/service_locator.dart';
import 'package:run_way/Features/home/data/models/BookModel.dart';
import 'package:run_way/Features/home/data/repos/home-repo_impl.dart';
import 'package:run_way/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:run_way/Features/home/presentation/views/BookDetailsView.dart';
import 'package:run_way/Features/home/presentation/views/HomeView.dart';
import 'package:run_way/Features/search/presentation/views/SearchView.dart';

import '../../Features/Splash/Presentation/views/SplashView.dart';

abstract class AppRouter{
 static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
      ),

      GoRoute(
        path: '/homeView',
        builder: (context, state) => Homeview(),
      ),

      GoRoute(
        path: '/BookDetailsView',
        builder: (context, state) => 
            BlocProvider(
                create: (context)=>SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
                child: BookDetailsView(
                  bookModel: state.extra as BookModel,
                )),
      ),

      GoRoute(
        path: '/SearchView',
        builder: (context, state) => SearchView(),
      ),
    ],
  );
}