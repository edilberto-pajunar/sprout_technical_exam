import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprout_technical_exam/bloc/product/product_bloc.dart';
import 'package:sprout_technical_exam/config/app_router.gr.dart';
import 'package:sprout_technical_exam/model/product.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () {
        BlocProvider.of<ProductBloc>(context).add(LoadProduct(id: "${product.id}"));
        context.pushRoute(ProductRoute(
          productId: "${product.id}",
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      product.thumbnail ?? "https://i.pinimg.com/564x/83/cb/7f/83cb7fd23d2d1b588b4ee3ea2988d496.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              product.title!,
              style: theme.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            // Text(
            //   "Stock: ${product.stock}",
            //   style: theme.textTheme.bodyMedium!.copyWith(
            //     color: Colors.grey,
            //   ),
            // ),

            Text(
              "Price: \$ ${product.price}",
              style: theme.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Discount: \$ ${product.discountPercentage}",
              style: theme.textTheme.bodyMedium!.copyWith(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
