import 'package:flutter/material.dart';
import 'package:mobile_store/components/cart_tile.dart';
import 'package:mobile_store/models/Mobile.dart';
import 'package:mobile_store/models/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeItemFromCart(Mobile mobile, ctx, index) {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(mobile);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.white,
          disabledTextColor: Colors.grey[100],
          onPressed: () {
            setState(
              () {
                Provider.of<Cart>(context, listen: false)
                    .getUserCart()
                    .insert(index, mobile);
              },
            );
          },
        ),
        content: const Text('Task deleted'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  Mobile mobile = value.getUserCart()[index];
                  return CartTile(
                    mobile: mobile,
                    onPressed: (context) =>
                        removeItemFromCart(mobile, context, index),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
