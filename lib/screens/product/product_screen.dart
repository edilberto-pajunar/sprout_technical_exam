import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:sprout_technical_exam/bloc/product/product_bloc.dart';

@RoutePage()
class ProductScreen extends StatelessWidget {
  const ProductScreen({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);

    return PopScope(
      onPopInvoked: (val) {
        context.read<ProductBloc>().add(const LoadProductList());
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ProductLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.35,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Image.network(
                              state.product.thumbnail!,
                              fit: BoxFit.cover,
                              height: size.height * 0.35,
                              width: double.infinity,
                            ),
                          ],
                        ),
                        Positioned(
                          top: 50,
                          left: 30,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () {
                                context.read<ProductBloc>().add(const LoadProductList());
                                context.maybePop();
                              },
                              icon: const Icon(Icons.arrow_back),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 80,
                            child: ListView.separated(
                              separatorBuilder: (contex, index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: state.product.images!.length,
                              itemBuilder: (context, index) {
                                final image = state.product.images![index];
                                return Container(
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Item",
                                  ),
                                  SizedBox(
                                    width: size.width * 0.5,
                                    child: Text(
                                      state.product.title ?? "",
                                      style: theme.textTheme.headlineSmall!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Text("Rating"),
                                  RatingStars(
                                    value: state.product.rating ?? 0.0,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    "Price",
                                  ),
                                  Text(
                                    " \$${state.product.price}",
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            "Description",
                          ),
                          Text(
                            state.product.description ?? "",
                            style: theme.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          const Text(
                            "Brand",
                          ),
                          Text(
                            state.product.brand ?? "",
                            style: theme.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          const Text(
                            "Category",
                          ),
                          Text(
                            state.product.category ?? "",
                            style: theme.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            "Stock: ${state.product.stock}",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text("Something went wrong."),
              );
            }
          },
        ),
      ),
    );
  }
}
