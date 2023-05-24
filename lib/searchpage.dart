import 'package:flutter/material.dart';
import 'package:taske_commerceresponsive/sample.dart';

import 'homepage.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<dynamic> searchlist = [...Homepage.items];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            ],
            title: TextField(
              textAlign: TextAlign.start,
              onChanged: (value) => updation(value),
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                hintText: 'Search Screen',
              ),
            )),
        body: searchlist.isEmpty
            ? const Center(
                child: Text(
                  'items not found',
                  style: TextStyle(fontSize: 28),
                ),
              )
            : GridView.builder(
                itemCount: searchlist.length,
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
                                    searchlist[index].path,
                                    height: 180,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            Column(
                              children: [
                                Text(
                                  searchlist[index].name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              searchlist[index].price.toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ));
                }));
  }

  void updation(String enteredName) {
    List<dynamic> result = [];

    if (enteredName.isEmpty) {
      setState(() {
        searchlist = Homepage.items;
      });
    } else {
      result.clear();
      for (var element in Homepage.items) {
        var res = element.name.startsWith(enteredName);
        if (res == true) {
          result.add(element);
        }
      }
      setState(() {
        searchlist = result;
      });
    }
  }
}
