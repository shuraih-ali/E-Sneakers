import 'package:e_sneakers/Components/shoe_tile.dart';
import 'package:e_sneakers/models/Shoe.dart';
import 'package:e_sneakers/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}
// add shoe to cart
void addShoeToCart(Shoe shoe, BuildContext context) {
  Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

  //alert the user, show successfully added to cart
  showDialog(context: context, builder: (context) => AlertDialog(
    title: Text('Successfully added'),
    content: Text('Check Your Cart'),
  ),);
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // search bar
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(padding: EdgeInsets.all(12.0), child: Text("Search")),
                Icon(Icons.search),
              ],
            ),
          ),

          // message
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Everyone flies... Some fly longer than others",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),

          // hot picks header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Hot Picks 🔥",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // list of shoes
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              itemCount: value.getShoeList().length,

              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                //get shoe from list
                Shoe shoe = value.getShoeList()[index];

                return ShoeTile(
                  shoe: shoe,
                  onTap: () => addShoeToCart(shoe,context),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Divider(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
