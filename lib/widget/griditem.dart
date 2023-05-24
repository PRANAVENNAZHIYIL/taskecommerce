import 'package:flutter/material.dart';
import 'package:taske_commerceresponsive/datamodel.dart';
import 'package:taske_commerceresponsive/homepage.dart';

import '../sample.dart';

class GridItem extends StatelessWidget {
  final String category;

  const GridItem({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    List<ProductModel> specificlist =
        category == "all" ? [...Homepage.items] : [];
    for (int i = 0; i < Homepage.items.length; i++) {
      if (Homepage.items[i].category == category) {
        specificlist.add(Homepage.items[i]);
      }
    }
    return GridView.builder(
        itemCount: specificlist.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.7),
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => DetailsPage(
                              index: index,
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      margin: const EdgeInsets.all(8),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            specificlist[index].path,
                            height: 180,
                            fit: BoxFit.fill,
                          )),
                    ),
                    Column(
                      children: [
                        Text(
                          specificlist[index].name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      specificlist[index].price.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ));
        });
  }
}
