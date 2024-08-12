import 'package:flutter/material.dart';
import 'package:helpfortrauma/screens/dashboard/components/product/product_info.dart';

class ProductCard extends StatelessWidget {
  final ProductInfo productInfo;

  const ProductCard({Key? key, required this.productInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productInfo.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 10),
                Text(productInfo.description, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          SizedBox(width: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(productInfo.imageUrl, width: 200, height: 150, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
