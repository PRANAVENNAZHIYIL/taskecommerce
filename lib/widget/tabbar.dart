import 'package:flutter/material.dart';
import 'package:taske_commerceresponsive/widget/griditem.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Align(
                alignment: Alignment.center,
                child: TabBar(
                  indicator: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25)),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 25),
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.white,
                  isScrollable: true,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(
                      text: 'All',
                    ),
                    Tab(text: "Men's"),
                    Tab(text: "Women's"),
                    Tab(text: 'Kids'),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  GridItem(
                    category: 'all',
                  ),
                  GridItem(
                    category: 'men',
                  ),
                  GridItem(
                    category: 'women',
                  ),
                  GridItem(
                    category: 'kids',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
