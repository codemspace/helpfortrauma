import 'package:flutter/material.dart';
import 'package:helpfortrauma/core/constants/color_constants.dart';

class FinanceTitle extends StatelessWidget {
  const FinanceTitle({super.key, required this.prefix, required this.title, required this.description});

  final String prefix;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    String part1 = ''; // Initialize part1 as an empty string
    String part2 = ''; // Initialize part2 as an empty string
    if (description.length > 100) {
      part1 = description.substring(0, 100);
      part2 = description.substring(100);
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$prefix ',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 6),
        description.length > 100 ? 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                part1,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: greyText,
                    fontSize: 14),
              ),
              // SizedBox(height: 6),
              Text(
                part2,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: greyText,
                    fontSize: 14),
              ),
            ],
          ) :
          Text(
            description,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: greyText,
                fontSize: 14),
          ),
        SizedBox(height: 26),
      ],
    );
  }
}
