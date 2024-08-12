import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helpfortrauma/screens/dashboard/components/finance/finance_card.dart';
import 'package:helpfortrauma/screens/dashboard/components/finance/finance_marks.dart';
import 'package:helpfortrauma/screens/dashboard/components/finance/finance_title.dart';

class FinanceServiceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cardWidth = 350.0; // Set your desired width
    double cardHeight = 300.0; // Set your desired height

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const FinanceTitle(prefix: 'A one-stop shop for', title: 'your finances.', description: 'Designed to work better together erat velit eget hac nulla nullam et id praesent nisi ornare risus risus consequat nunc nisl pellentesque diam neque.'),
          SizedBox(height: 20),
          Wrap(
            spacing: 20, // Horizontal space between cards
            runSpacing: 20, // Vertical space between cards
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: cardWidth,
                  maxHeight: cardHeight,
                ),
                child: FinanceCard(
                  title: 'Checking accounts',
                  subtitle: 'Interdum et malesuada fames ac ante ipsum primis in faucibus.',
                  buttonText: 'View All Accounts',
                  image: 'assets/images/finance/feature-img-1.jpg',
                  icon: FontAwesomeIcons.buildingColumns,
                  onTap: () {},
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: cardWidth,
                  maxHeight: cardHeight,
                ),
                child: FinanceCard(
                  title: 'Credit cards',
                  subtitle: 'Interdum et malesuada fames ac ante ipsum primis in faucibus.',
                  buttonText: 'Apply Credit Cards',
                  image: 'assets/images/finance/feature-img-2.jpg',
                  icon: FontAwesomeIcons.creditCard,
                  onTap: () {},
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: cardWidth,
                  maxHeight: cardHeight,
                ),
                child: FinanceCard(
                  title: 'Investment',
                  subtitle: 'Interdum et malesuada fames ac ante ipsum primis in faucibus.',
                  buttonText: 'Start Investments',
                  image: 'assets/images/finance/feature-img-3.jpg',
                  icon: FontAwesomeIcons.chartLine,
                  onTap: () {},
                ),
              )
            ],
          ),
          SizedBox(height: 28),
          FinanceMarks()
        ],
      ),
    );
  }
}







