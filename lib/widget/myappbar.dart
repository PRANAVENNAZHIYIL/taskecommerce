import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:taske_commerceresponsive/searchpage.dart';

import '../sample.dart';
import 'cart.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        children: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          SizedBox(width: 10),
          Text(
            ' Hi, Arif',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SearchPage()));
            // Handle search button press
          },
        ),
        InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage())),
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
                                fontSize: 10, color: Colors.white),
                          ),
                        ),
                      )),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
