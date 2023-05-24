import 'package:flutter/material.dart';
import 'package:taske_commerceresponsive/datamodel.dart';
import 'package:taske_commerceresponsive/homepage.dart';
import 'package:taske_commerceresponsive/sample.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});
  static ValueNotifier<List<ProductModel>> cartItems = ValueNotifier([]);
  int totalprice = 0;
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    calculateTotalPrice();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: CartPage.cartItems.value.isEmpty
          ? const Center(
              child: Text(
                "No items found",
                style: TextStyle(fontSize: 30),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ValueListenableBuilder(
                      valueListenable: CartPage.cartItems,
                      builder: (context, value, _) {
                        return ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            return buildCartItem(value[index], index);
                          },
                        );
                      }),
                ),
                const SizedBox(height: 20),
                Text(
                  'Total Price: \$${widget.totalprice}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Place your order logic here
                  },
                  child: const Text('Place Order'),
                ),
              ],
            ),
    );
  }

  Widget buildCartItem(ProductModel item, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              item.path,
              width: 80,
              height: 80,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text('Price: \$${item.price}'),
                      const SizedBox(
                        width: 20,
                      ),
                      Text('size: ${item.selectsize}')
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          decrementItem(item);
                        },
                        child: const Icon(Icons.remove),
                      ),
                      const SizedBox(width: 10),
                      Text(item.quantity.toString()),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          incrementItem(item);
                        },
                        child: const Icon(Icons.add),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      IconButton(
                          onPressed: () {
                            removeItem(index);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateTotalPrice() {
    int total = 0;
    for (var item in CartPage.cartItems.value) {
      total += item.price * item.quantity;
    }
    setState(() {
      widget.totalprice = total;
    });
  }

  void incrementItem(ProductModel item) {
    setState(() {
      item.quantity++;
    });
  }

  void decrementItem(ProductModel item) {
    if (item.quantity > 0) {
      setState(() {
        item.quantity--;
      });
    }
  }

  void removeItem(int index) {
    DetailsPage.added.value = false;
    cartCount--;

    final currentindex =
        Homepage.items.indexOf(CartPage.cartItems.value[index]);
    Homepage.items[currentindex].quantity = 0;
    CartPage.cartItems.value.removeAt(index);
    calculateTotalPrice();

    CartPage.cartItems.notifyListeners();
  }
}
