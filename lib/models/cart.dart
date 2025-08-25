import 'package:e_sneakers/models/Shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  //list of shoes for sales
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Adidas',
      price: '236',
      description: 'These are the best Adidas',
      imagePath: 'lib/Images/Adidas.png',
    ),
    Shoe(
      name: 'Air Max',
      price: '500',
      description: 'Fly in the Air',
      imagePath: 'lib/Images/walkaro.jpeg',
    ),
    Shoe(
      name: 'Nike',
      price: '99',
      description: 'Best Nike Ever Made',
      imagePath: 'lib/Images/Nike.png',
    ),
    Shoe(
      name: 'Jor',
      price: '454',
      description: 'Jordan the class',
      imagePath: 'lib/Images/jor.jpg',
    ),
  ];
  //list of items in user cart
  List<Shoe> userCart = [];
  //get list of shoes for sales
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove items from cart

  void removeItemFormCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
    
  }
}
