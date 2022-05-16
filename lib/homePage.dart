import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/cartPage.dart';
import 'package:test_flutter/cartProvider.dart';
import 'package:test_flutter/colors.dart';
import 'package:test_flutter/models/cartModel.dart';
import 'package:test_flutter/models/categoryModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categoryList = [
    new CategoryModel("بيتزا", "imgs/pizza.png"),
    new CategoryModel("سندوتشات", "imgs/hamburger.png"),
    new CategoryModel("مشروبات", "imgs/coffee.png"),
    new CategoryModel("الكل", "")
  ];

  List<CartModel> allProducts = [
    new CartModel(
        "imgs/4777488_cheddar-png-transparent-lays-chips-png-png-download.png",
        "عصير تفاح 250 ملي\n المخزون : 5",
        1),
    new CartModel("imgs/4598025_apple-juice-png-hydra-juice-75-apple-juice.png",
        "عصير تفاح 250 ملي\n المخزون : 5", 1),
    new CartModel(
        "imgs/3750754_cookies-and-cream-png-chcocolate-sandwich-cookies-filled.png",
        "عصير تفاح 250 ملي\n المخزون : 5",
        1),
    new CartModel(
        "imgs/3474585_ice-cream-sandwich-png-mms-choc-cookie-sandwich.png",
        "عصير تفاح 250 ملي\n المخزون : 5",
        1),
    new CartModel(
        "imgs/2957433_breakfast-sandwich-png-be-7-breakfast-sandwich-hd.png",
        "عصير تفاح 250 ملي\n المخزون : 5",
        1),
    new CartModel("imgs/561924_ice-cream-cone-png-ice-cream-cone-without.png",
        "عصير تفاح 250 ملي\n المخزون : 5", 1),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = ((size.height - kToolbarHeight - 20) / 2) - 80;
    final double itemWidth = size.width / 2;
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
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications,
                              color: Colors.white,
                            )),
                        SizedBox(
                          width: 150,
                        ),
                        Image(
                          image: AssetImage("imgs/title.png"),
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image(
                          height: 40,
                          width: 40,
                          image: AssetImage("imgs/Notregistered.png"),
                          fit: BoxFit.cover,
                        ),
                        Image(
                          height: 40,
                          width: 40,
                          image: AssetImage("imgs/searchbynumber.png"),
                          fit: BoxFit.cover,
                        ),
                        Container(
                          height: 40,
                          width: 250,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefix: Image(
                                  height: 20,
                                  width: 20,
                                  fit: BoxFit.cover,
                                  image: AssetImage("imgs/search.png")),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  //  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              hintText: 'اسم الطالب',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            topLeft: Radius.circular(8))),
                    child: ListView.builder(
                        itemCount: categoryList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: _buildHorizontalList(
                                  categoryList[index].title,
                                  categoryList[index].imgUrl));
                        }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                    ),
                    // height: MediaQuery.of(context).size.height - 100,
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: (itemWidth / itemHeight),
                        controller:
                            new ScrollController(keepScrollOffset: false),
                        shrinkWrap: true,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        scrollDirection: Axis.vertical,
                        // shrinkWrap: true,
                        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //   mainAxisSpacing: 0,
                        //     crossAxisCount: 2,
                        //     crossAxisSpacing: 5),
                        children: [
                          _buildGridView(allProducts[0]),
                          _buildGridView(allProducts[1]),
                          _buildGridView(allProducts[2]),
                          _buildGridView(allProducts[3]),
                          _buildGridView(allProducts[4]),
                          _buildGridView(allProducts[5]),
                        ]),
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
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => new CartPage()));
                    },
                    child: Badge(
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
                  ),
                  Image(image: AssetImage("imgs/المشتريات.png")),
                  Image(image: AssetImage("imgs/المحفظة.png")),
                  Image(image: AssetImage("imgs/الرئيسية.png")),
                ],
              ),
            ),
          )
        ],
      )
          // SingleChildScrollView(
          //     child: ),
          ),
    );
  }

  Widget _buildHorizontalList(String title, String imgUrl) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
          color: (title == "الكل") ? mainColor : Colors.white,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title == "الكل"
              ? Container(
                  width: 10,
                  height: 20,
                )
              : Image(height: 20, width: 20.0, image: AssetImage(imgUrl)),
          Center(
            child: Text(
              title,
              style: TextStyle(
                  color: (title == "الكل") ? Colors.white : mainColor,
                  fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGridView(CartModel cartModel) {
    final cartItemProvider = Provider.of<CartProvider>(context);
    return Padding(
        padding: EdgeInsets.all(5.0),
        child: Card(
          color: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(image: AssetImage("imgs/cal.png")),
                    Image(image: AssetImage("imgs/info.png")),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Image(image: AssetImage(cartModel.imgUrl)),
                SizedBox(
                  height: 5,
                ),
                Text(
                  cartModel.desc,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image(image: AssetImage("imgs/Price.png")),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                        onTap: () {
                          cartItemProvider.addToCart(cartModel);
                        },
                        child: Image(image: AssetImage("imgs/plus.png"))),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
