import 'package:cached_network_image/cached_network_image.dart';
import 'package:farmers_network/pages/cart.dart';
import 'package:farmers_network/pages/widgets/BottomNav.dart';
import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShopState();
  }
}

class _ShopState extends State<Shop> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;

  List<dynamic> products = [
    {
      "productId": 2,
      "name": "Capscum Seeds",
      "description": "Sygenta",
      "price": "175",
    },
    {
      "productId": 2,
      "name": "Capscum Seeds",
      "description": "Sygenta",
      "price": "175",
    },
    {
      "productId": 2,
      "name": "Capscum Seeds",
      "description": "Sygenta",
      "price": "175",
    },
    {
      "productId": 2,
      "name": "Capscum Seeds",
      "description": "Sygenta",
      "price": "175",
    },
    {
      "productId": 2,
      "name": "Capscum Seeds",
      "description": "Sygenta",
      "price": "175",
    },
    {
      "productId": 2,
      "name": "Capscum Seeds",
      "description": "Sygenta",
      "price": "175",
    },
    {
      "productId": 2,
      "name": "Capscum Seeds",
      "description": "Sygenta",
      "price": "175",
    },
  ];
  var categories = ["Relevant", "Filter"];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 230) / 2;

    final double itemWidth = size.width / 2;
    Widget _productItem(dynamic product) {
      print(product.toString());
      return InkWell(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          margin: EdgeInsets.only(bottom: 20, right: 5, left: 5),
          child: Container(
            // padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //cached image
                Container(
                  height: 150,
                  // width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  child: CachedNetworkImage(
                    imageUrl: " ",

//              errorWidget: (context, url, error) => Icon(Icons.image),
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Text(
                    product['name'],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 6)),
                Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Text(
                      product['description'],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).primaryColor,
                      ),
                    )),

                Padding(
                  padding: EdgeInsets.only(top: 6),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: RichText(
                      text: TextSpan(children: [
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(2, -4),
                            child: Text("\$ " + product['price'],
                                textScaleFactor: 0.7,
                                style: TextStyle(
                                  fontFamily: 'NexaLight',
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                  // fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ]),
                    )),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: Color(0xFF8EBA43),
                        ),
                        child: Icon(Icons.favorite,
                            color: Colors.white, size: 22)),
                    SizedBox(width: 5),
                    Container(
                        alignment: Alignment.center,
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Icon(Icons.add_shopping_cart,
                            color: Colors.white, size: 22)),
                    SizedBox(width: 5),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget body() {
      return Container(
        child: CustomScrollView(slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor,
                    ])),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        child: TextField(
                          onSubmitted: (value) {
                            // onSendMessage(textEditingController.text, 0);
                          },
                          style: TextStyle(fontSize: 15.0),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search products ',
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            prefixIcon: Icon(
                              Icons.menu,
                              color: Color(0xFF8EBA43),
                            ),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Color(0xFF8EBA43),
                            ),
                            // hintStyle: TextStyle(color: greyColor),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        // height: 30,width: 30,
                        margin: EdgeInsets.all(5),
                        // padding:
                        //     EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mic,
                            color: Color(0xFF8EBA43),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      constraints: BoxConstraints(
                        minWidth: 80,
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                          left: 40.0, top: 8, bottom: 8, right: 40.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_drop_down,
                          ),
                          Text(
                            "Relevant",
                            style: TextStyle(
                                fontFamily: "NexaLight", fontSize: 14),
                          )
                        ],
                      )),
                  SizedBox(width: 10),
                  Container(
                    constraints: BoxConstraints(
                      minWidth: 80,
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                        left: 40.0, top: 8, bottom: 8, right: 40.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Row(
                      children: [
                        Icon(
                          Icons.filter_list_outlined,
                        ),
                        Text(
                          "Filter",
                          style:
                              TextStyle(fontFamily: "NexaLight", fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Cart()));
                      },
                      child: Container(
                        constraints: BoxConstraints(minWidth: 50),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                            left: 2.0, top: 8, bottom: 8, right: 2.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Row(
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      )),
                  SizedBox(width: 10),
                ],
              )
            ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 10,
              ),
            ]),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / itemHeight),
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _productItem(products[index]);
              },
              childCount: products.length,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 50,
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate([BottomNav()]),
          ),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Shop",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ])),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: 16,
              right: 16,
            ),
            child: Stack(
              children: <Widget>[
                Icon(Icons.menu),
              ],
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          body(),
        ],
      ),
    );
  }
}
