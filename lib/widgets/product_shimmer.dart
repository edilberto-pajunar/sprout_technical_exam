import 'package:flutter/material.dart';
import 'package:sprout_technical_exam/widgets/shimmer.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget.image(
            height: 150,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          const SizedBox(height: 4.0),
          const ShimmerWidget.rectangular(height: 20),
          const SizedBox(height: 4.0),
          const ShimmerWidget.rectangular(height: 40),
        ],
      ),
    );
  }
}
