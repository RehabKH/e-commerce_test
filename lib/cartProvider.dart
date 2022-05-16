import 'package:flutter/widgets.dart';
import 'package:test_flutter/models/cartModel.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> cartModel = [];

  addToCart(CartModel cartItem) {
    if(!itemExist(cartItem)){
  cartModel.add(cartItem);
    notifyListeners();
    }
  
  }

  bool itemExist(CartModel cartItem) {
    for (int i = 0; i < cartModel.length; i++) {
      if (cartItem.imgUrl == cartModel[i].imgUrl) {
        cartModel[i].quantity++;
        notifyListeners();
        // break;
        return true;
      } else {
        continue;
      }
    }
    return false;
    //
    // print("cartList::::::::::::::::::::::::::::::::::::::::::" +
    //     cartModel.length.toString());
  }
}
