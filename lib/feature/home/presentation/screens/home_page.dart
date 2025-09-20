import 'package:flutter/material.dart';
import 'package:hotelino/feature/home/presentation/provider/home_provider.dart';
import 'package:hotelino/feature/home/presentation/widgets/ad_banner.dart';
import 'package:hotelino/feature/home/presentation/widgets/home_appbar.dart';
import 'package:hotelino/feature/home/presentation/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return const Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 16),
            SearchBarWidget(),
            SizedBox(height: 16),
            AdBanner(),
          ],
        ),
      ),
    );
  }
}
