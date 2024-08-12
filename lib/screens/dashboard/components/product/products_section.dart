import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helpfortrauma/core/constants/color_constants.dart';

class ProductsSection extends StatefulWidget {
  @override
  _ProductsSectionState createState() => _ProductsSectionState();
}

class _ProductsSectionState extends State<ProductsSection> {
  int _selectedProductIndex = 0;

  final List<Map<String, dynamic>> products = [
    {
      'title': 'For small business',
      'description': 'Interdum et malesuad a fames ac ante ipsum primis in faucibus. Simple dummy content. Sed lacinia gsmod dui euismod id.',
      'icon': FontAwesomeIcons.buildingColumns,
      'image': 'assets/images/finance/finance-tab-1.jpg',
    },
    {
      'title': 'For startups',
      'description': 'Interdum et malesuad a fames ac ante ipsum primis in faucibus. Simple dummy content. Sed lacinia gsmod dui euismod id.',
      'icon': FontAwesomeIcons.creditCard,
      'image': 'assets/images/finance/finance-tab-2.jpg',
    },
    {
      'title': 'For enterprises',
      'description': 'Interdum et malesuad a fames ac ante ipsum primis in faucibus. Simple dummy content. Sed lacinia gsmod dui euismod id.',
      'icon': FontAwesomeIcons.moneyBill,
      'image': 'assets/images/finance/finance-tab-3.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding * 5, vertical: 40),
      height: 800,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Products designed for ',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              children: [
                TextSpan(
                  text: 'all sizes businesses.',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Enim sed parturient sem enim nunc sit erat velit eget hac nulla et id praesent nisi ornare risus risus consequat nunc nisl pellentesque diam neque.',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[600],
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.0),
          Expanded(child: buildProductCarousel()),
        ],
      ),
    );
  }

  Widget buildProductCarousel() {
    return Row(
      children: [
        Expanded(
          flex: 1, // Ensures it takes a certain portion of the screen
          child: Container(
            padding: EdgeInsets.only(right: 100),
            child: ListView.builder(
              shrinkWrap: true, // Prevents ListView from using infinite height
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                final bool isSelected = _selectedProductIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedProductIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
                    decoration: BoxDecoration(
                      color: isSelected ? secondaryColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RawMaterialButton(
                          onPressed: () {},
                          elevation: 2.0,
                          fillColor: Color(0xFFF5F6F9),
                          child: Icon(product['icon'], color: Colors.deepPurple,),
                          padding: EdgeInsets.all(14.0),
                          shape: CircleBorder(),
                        ),
                        // Icon(
                        //   product['icon'],
                        //   color: isSelected ? Colors.deepPurple : Colors.black87,
                        //   size: 24,
                        // ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['title'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected ? Colors.deepPurple : Colors.black,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                product['description'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ),
        Expanded(
          flex: 1, // Allows the image to take a larger part of the row
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              products[_selectedProductIndex]['image'],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
