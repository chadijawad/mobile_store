import 'package:flutter/material.dart';
import 'package:mobile_store/components/mobile_tile.dart';
import 'package:mobile_store/models/Mobile.dart';
import 'package:mobile_store/models/cart.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _CartPageState();
}

class _CartPageState extends State<ShopPage> {
  void addMobileToCart(Mobile mobile) {
    Provider.of<Cart>(context, listen: false).addItemToCart(mobile);
    showDialog(context: context, builder: (context) => const AlertDialog(
      title: Text('Successfully added!'),
      content: Text('Check Your Cart'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Text(
              'Upgrade your connectivity at our mobile store',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot Picks 🔥',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text('see all')
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: value.getMobileList().length,
              itemBuilder: (context, index) {
                Mobile mobile = value.getMobileList()[index];
                return MobileTile(
                  mobile: mobile,
                  onTap: () {
                    addMobileToCart(mobile);
                  },
                );
              },
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 25, left: 25, right: 25))
        ],
      ),
    );
  }
}
