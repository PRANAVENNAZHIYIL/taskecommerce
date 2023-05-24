import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:taske_commerceresponsive/homepage.dart';
import 'package:taske_commerceresponsive/widget/cart.dart';
import 'package:taske_commerceresponsive/widget/variables/widgets.dart';

RxInt cartCount = 0.obs;

class DetailsPage extends StatefulWidget {
  final int index;
  static ValueNotifier<bool> added = ValueNotifier(false);

  const DetailsPage({super.key, required this.index});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<String> finallist = [];
  bool first = true;
  bool second = false;
  bool third = false;

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            title: const Text('Details'),
            //leading: const Icon(Icons.arrow_back),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 7),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartPage()));
                        },
                        child: Stack(
                          children: [
                            const Icon(
                              Icons.shopping_cart_outlined,
                              size: 28,
                            ),
                            Obx(
                              () => Visibility(
                                visible: cartCount != 0,
                                child: Positioned(
                                    top: 1,
                                    right: 1,
                                    child: CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Colors.red,
                                      child: Center(
                                        child: Text(
                                          cartCount.toString(),
                                          style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              )
            ]),
        floatingActionButton: ValueListenableBuilder(
            valueListenable: DetailsPage.added,
            builder: (context, value, _) {
              return FloatingActionButton.extended(
                shape: const StadiumBorder(),
                onPressed: () {
                  setState(() {
                    DetailsPage.added.value = true;
                  });

                  Homepage.items[widget.index].selectsize =
                      valueNotifierColor.value;
                  if (!CartPage.cartItems.value
                      .contains(Homepage.items[widget.index])) {
                    Homepage.items[widget.index].quantity++;
                    cartCount++;

                    CartPage.cartItems.value.add(Homepage.items[widget.index]);
                  }
                  //  else {
                  //   final currentindex = CartPage.cartItems.value
                  //       .indexOf(Homepage.items[widget.index]);
                  //   CartPage.cartItems.value[currentindex].quantity++;
                  // }
                },
                backgroundColor: Colors.black,
                label: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.shopping_cart_outlined,
                          color: Colors.white),
                      const SizedBox(width: 5),
                      DetailsPage.added.value
                          ? const Text(
                              'Added',
                              style: TextStyle(color: Colors.white),
                            )
                          : const Text(
                              'Add to bag',
                              style: TextStyle(color: Colors.white),
                            )
                    ],
                  ),
                ),
              );
            }),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  FanCarouselImageSlider(
                      isClickable: false,
                      sidesOpacity: 0,
                      autoPlay: false,
                      turns: 250,
                      currentItemShadow: const [],
                      sliderHeight: MediaQuery.of(context).size.height * 0.4,
                      sliderWidth: MediaQuery.of(context).size.width,
                      imageFitMode: BoxFit.fill,
                      imagesLink: finallist.isNotEmpty
                          ? finallist
                          : Homepage.items[13].image!,
                      isAssets: true),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 250,
                              child: Text(
                                Homepage.items[widget.index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  first = true;
                                  second = false;
                                  third = false;
                                  finallist = Homepage.items[13].image!;
                                });
                              },
                              child: CircleAvatar(
                                maxRadius: 12,
                                backgroundColor:
                                    first ? Colors.black : Colors.white,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                      color: Colors.yellow,
                                      shape: BoxShape.circle),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  second = true;
                                  first = false;
                                  third = false;
                                  finallist = Homepage.items[13].image1!;
                                });
                              },
                              child: CircleAvatar(
                                maxRadius: 12,
                                backgroundColor:
                                    second ? Colors.purple : Colors.white,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  third = true;
                                  second = false;
                                  first = false;
                                  finallist = Homepage.items[13].image2!;
                                });
                              },
                              child: CircleAvatar(
                                maxRadius: 12,
                                backgroundColor:
                                    third ? Colors.purple : Colors.white,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ValueListenableBuilder(
                      valueListenable: valueNotifierColor,
                      builder: (context, value, child) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 65),
                          child: Row(
                            children: [
                              buttons4('S'),
                              buttons4('L'),
                              buttons4('X'),
                              buttons4('XL'),
                            ],
                          ),
                        );
                      })
                ],
              ),
              const Positioned(
                bottom: 10,
                left: 2,
                child: Text(
                  '100',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
