import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobile_store/models/Mobile.dart';

class CartTile extends StatefulWidget {
  final Mobile mobile;
  final void Function(BuildContext)? onPressed;
  const CartTile({super.key, required this.mobile,required this.onPressed});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {


  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          onPressed: widget.onPressed,
          icon: Icons.delete,
          backgroundColor: Colors.white24,
          borderRadius: BorderRadius.circular(12),
        ),
      ]),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          leading: Image.asset(widget.mobile.imagePath),
          title: Text(widget.mobile.name),
          subtitle: Text(' \$ ${widget.mobile.price}'),
        ),
      ),
    );
  }
}
