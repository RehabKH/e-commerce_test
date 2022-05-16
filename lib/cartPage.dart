import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/cartProvider.dart';
import 'package:test_flutter/colors.dart';
import 'package:test_flutter/homePage.dart';
import 'package:test_flutter/models/cartModel.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartItemProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: Stack(
        fit: StackFit.loose,
        children: [
          SingleChildScrollView(
            child: Container(
              // height: MediaQuery.of(context).size.height -200,
              color: mainColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:  Container(
                      height: 45,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(
                          "الطلبات الحاليه",
                          style: TextStyle(
                              
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                  height: 60,
                    color: secondColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            "ملخص الطلبات الواردة",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                  
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: secondColor,
                        // borderRadius: BorderRadius.only(
                        //     topRight: Radius.circular(8),
                        //     topLeft: Radius.circular(8))
                            ),
                    child: ListView.builder(
                        itemCount: cartItemProvider.cartModel.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: _buildCartItem(
                                  cartItemProvider.cartModel[index]));
                        }),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 140,
            child: Container(
              height: 100,
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(image: AssetImage("imgs/المزيد.png")),
                  Badge(
                    badgeColor: Colors.red,
                    position: BadgePosition.topEnd(top: -13, end: 10),
                    badgeContent: Text(
                      (cartItemProvider.cartModel == null)
                          ? ""
                          : '${cartItemProvider.cartModel!.length}',
                      style: TextStyle(color: Colors.white),
                    ),
                    child: Image(image: AssetImage("imgs/انشاء طلب.png")),
                  ),
                  Image(image: AssetImage("imgs/المشتريات.png")),
                  Image(image: AssetImage("imgs/المحفظة.png")),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => new HomePage()));
                      },
                      child: Image(image: AssetImage("imgs/الرئيسية.png"))),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 300,
            left: 50,
            child: Column(
              children: [
                 Row(
              
              children: [
             
              
              Text(
                 (cartItemProvider.cartModel == null)
                          ? "0"
                          : '${cartItemProvider.cartModel!.length}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
              ),SizedBox(width: 180,), Text("عدد الطلبات",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

            ]),
            SizedBox(height: 10,),
          Divider(
            thickness: 5,
                  // indent: 20,
                  // endIndent: 0,
                  // color: Colors.black,
            color: Colors.grey[200],),
            SizedBox(
                  height: 10,
                ),
                Row(children: [
                Image(image: AssetImage("imgs/Price.png")),
                  SizedBox(
                    width: 170,
                  ),
                  Text("المجموع",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ]),
              ],
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height - 200,
              left: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
               
               ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.red,
                      shadowColor: Colors.red,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      minimumSize: Size(110, 40), //////// HERE
                    ),
                    // style: ButtonStyle(
                    //     // fixedSize: MaterialStateProperty.al,
                    //     backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () {},
                    child: Center(
                        child: Text(
                      "رفض الطلب",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    )),
                  ) ,
                  SizedBox(
                    width: 60,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      onPrimary: mainColor,
                      shadowColor: mainColor,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      minimumSize: Size(110, 40), //////// HERE
                    ),
                    onPressed: () {},
                    child: Center(
                        child: Text(
                      "قبول الطلب",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    )),
                  ),
                ],
              )),
        ],
      )),
    );
  }

  Widget _buildCartItem(CartModel cartItem) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Text(cartItem.desc),
              leading: Image(image: AssetImage(cartItem.imgUrl)),
              trailing: Text(
                cartItem.quantity.toString(),
                style: TextStyle(color: mainColor, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
