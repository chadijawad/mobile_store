import 'package:flutter/material.dart';
import 'package:mobile_store/models/Mobile.dart';

class Cart extends ChangeNotifier {
  List<Mobile> mobileShop = [
    Mobile(
        name: 'S23 Ultra',
        price: "790",
        imagePath: 'images/s23ultra.png',
        description: 'Samsung pinnacle of innovation in a sleek powerhouse'),
    Mobile(
        name: 'A 54',
        price: '380',
        imagePath: 'images/A54.jpg',
        description:
            'A stylish midrange marvel by Samsung, delivering impressive features and performance'),
    Mobile(
        name: 'Z fold',
        price: '999',
        imagePath: 'images/zfold.jpg',
        description:
            'Samsung revolutionary foldable phone, seamlessly combining style and cutting-edge technology'),
    Mobile(
        name: 'Iphone 15',
        price: '1099',
        imagePath: 'images/iphone15.jpeg',
        description:
            'Apple latest pinnacle of innovation, blending style, power, and advanced features for an exceptional user experience'),
  ];
  List<Mobile> userCart = [];

  List<Mobile> getMobileList() {
    return mobileShop;
  }

  List<Mobile> getUserCart() {
    return userCart;
  }

  void addItemToCart(Mobile mobile) {
    userCart.add(mobile);
    notifyListeners();
  }

  void removeItemFromCart(Mobile mobile) {
    userCart.remove(mobile);
    notifyListeners();
  }
}
