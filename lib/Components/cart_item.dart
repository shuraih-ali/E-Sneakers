import 'package:e_sneakers/models/Shoe.dart';
import 'package:e_sneakers/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class cartItem extends StatefulWidget {
  Shoe shoe;
  cartItem({super.key, required this.shoe});

  @override
  State<cartItem> createState() => _CartItemState();
}

class _CartItemState extends State<cartItem> {
  //remove item from the cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFormCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(widget.shoe.name),
        subtitle: Text("\$${widget.shoe.price}"),
        trailing: IconButton(onPressed:removeItemFromCart,icon:Icon(Icons.delete),),
      ),
    );
  }
}
