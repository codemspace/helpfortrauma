import 'package:flutter/material.dart';
import 'package:helpfortrauma/core/constants/color_constants.dart';
import 'package:helpfortrauma/screens/dashboard/components/black/block_card_step.dart';
import 'package:helpfortrauma/screens/dashboard/components/customer/customer_success_stories.dart';
import 'package:helpfortrauma/screens/dashboard/components/experience/experience_banking_section.dart';
import 'package:helpfortrauma/screens/dashboard/components/finance/finance_service_section.dart';
import 'package:helpfortrauma/screens/layouts/header.dart';
import 'package:helpfortrauma/screens/dashboard/components/banking_service_section.dart';
import 'package:helpfortrauma/screens/dashboard/components/featured_in_logos.dart';
import 'package:helpfortrauma/screens/dashboard/components/product/products_section.dart';
import 'package:helpfortrauma/screens/dashboard/components/stat/stats_section.dart';
import 'package:helpfortrauma/screens/layouts/footer.dart';


class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Header(),
            ),
          ),
          SliverToBoxAdapter(child: BankingServiceSection()),
          SliverPadding(padding: EdgeInsets.all(defaultPadding * 2)),
          SliverToBoxAdapter(child: FeaturedInLogos()),
          SliverPadding(padding: EdgeInsets.all(defaultPadding * 1)),
          SliverToBoxAdapter(child: FinanceServiceSection()),
          SliverPadding(padding: EdgeInsets.all(defaultPadding * 1)),
          SliverToBoxAdapter(child: StatsSection()),
          SliverPadding(padding: EdgeInsets.all(defaultPadding * 2)),
          SliverToBoxAdapter(child: ProductsSection()),
          SliverPadding(padding: EdgeInsets.all(defaultPadding * 2)),
          SliverToBoxAdapter(child: BlockCardStepsSection()),
          SliverPadding(padding: EdgeInsets.all(defaultPadding * 3)),
          SliverToBoxAdapter(child: CustomerReviews()),
          SliverPadding(padding: EdgeInsets.all(defaultPadding * 2)),
          SliverToBoxAdapter(child: ExperienceBankingSection()),
          SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }
}
