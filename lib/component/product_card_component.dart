import 'package:flutter/material.dart';
import 'package:wedevs/component/custom_text_component.dart';
import 'package:wedevs/const/color_const.dart';
import 'package:wedevs/const/const_methods.dart';
import 'package:wedevs/model/product_model.dart' as data;

class ProductCard extends StatelessWidget {
  final data.ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                product.permalink,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: product.name,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    CustomText(
                      text: '\$${product.regularPrice}',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      textDecoration: TextDecoration.lineThrough,
                      color: HexColor(ColorConst.grey150Color),
                    ),
                    const SizedBox(width: 8),
                    CustomText(
                      text: '\$${product.price}',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: HexColor(ColorConst.blackColor),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < product.ratingCount
                          ? Icons.star
                          : Icons.star_border,
                      size: 16,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
