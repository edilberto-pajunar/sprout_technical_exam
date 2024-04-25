import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprout_technical_exam/bloc/product/product_bloc.dart';
import 'package:sprout_technical_exam/config/app_router.dart';
import 'package:sprout_technical_exam/repository/product/product_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => ProductRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  ProductBloc(productRepository: context.read<ProductRepository>())..add(const LoadProductList())),
        ],
        child: MaterialApp.router(
          routerConfig: appRouter.config(),
        ),
      ),
    );
  }
}
