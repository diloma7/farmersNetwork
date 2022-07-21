import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartState();
  }
}

class _CartState extends State<Cart> {
  List<dynamic> products = [
    {
      "productId": 2,
      "name": "Capscum Seeds",
      "description": "Sygenta",
      "price": "175",
      "units": 2
    },
    {
      "productId": 2,
      "name": "Capscum Seeds",
      "description": "Sygenta",
      "price": "175",
      "units": 2
    },
    {
      "productId": 2,
      "name": "Capscum Seeds",
      "description": "Sygenta",
      "price": "175",
      "units": 2
    },
    {
      "productId": 2,
      "name": "Capscum Seeds",
      "description": "Sygenta",
      "price": "175",
      "units": 2
    },
    {
      "productId": 2,
      "name": "Capscum Seeds",
      "description": "Sygenta",
      "price": "175",
      "units": 2
    },
  ];
  var categories = ["Relevant", "Filter"];

  @override
  Widget build(BuildContext context) {
    Widget _cartItem(dynamic cart, int index) {
      return Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2))),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          padding: EdgeInsets.only(left: 5, right: 5, bottom: 2),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 12),
              ),
              Row(
                children: [
                  Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      // shape: BoxShape.circle,
                      // borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    margin: EdgeInsets.only(left: 2, right: 2),
                    child: CachedNetworkImage(
                      imageUrl: '',
//              errorWidget: (context, url, error) => Icon(Icons.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cart['name'],
                          style: TextStyle(
                            fontFamily: 'NexaBold',
                            fontSize: 14,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 6),
                        ),
                        RichText(
                          text: TextSpan(children: [
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(2, -4),
                                child: Text(
                                    "\$" +
                                        ((double.parse(cart['price']) *
                                                cart['units'])
                                            .toString()),
                                    textScaleFactor: 0.7,
                                    style: TextStyle(
                                      fontFamily: 'NexaLight',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      // fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.clear,
                    size: 18,
                    color: Color(0xFF8EBA43),
                  ),
                  //buttons
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      child: Container(
                        padding: EdgeInsets.only(left: 6, right: 6),
                        child: Text(
                          "-",
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'NexaBold',
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          if (cart.units > 1) {
                            cart.units = cart.units - 1;
                          } else if (cart.units == 1) products.removeAt(index);
                        });
                      }),
                  Text(
                    cart['units'].toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'NexaBold',
                    ),
                  ),
                  InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // borderRadius: BorderRadius.all(Radius.circular(8))
                          ),
                          padding: EdgeInsets.only(left: 6, right: 6),
                          child: Text("+",
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'NexaBold',
                              ))),
                      onTap: () {
                        setState(() {});
                      }),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget body() {
      return Container(
        child: CustomScrollView(slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              // SizedBox(
              //   height: 10,
              // )
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int i) {
                return _cartItem(products[i], i);
              },
              childCount: products.length,
            ),
          ),
        ]),
      );
    }

    Widget _totalWidget() {
      return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            padding: EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: 'Total: ',
                                  style: TextStyle(
                                    fontFamily: 'NexaLight',
                                    fontSize: 14,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          Container(
                            // padding: EdgeInsets.all(10),
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: '\$ 1,200',
                                  style: TextStyle(
                                    fontFamily: 'NexaBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: RaisedButton(
                          onPressed: () {},
                          textColor: Colors.black,
                          padding: EdgeInsets.only(
                              left: 15, right: 15, top: 5, bottom: 5),
                          color: Colors.yellow,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          child: Text(
                            "CHECKOUT",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Segoe",
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ));
    }

    return Scaffold(
      backgroundColor: Color(0xFFf7f8fa),
      appBar: AppBar(
        backgroundColor: Color(0xFF4b7344),
        title: Text(
          "Cart ",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: 16,
              right: 16,
            ),
            child: Stack(
              children: <Widget>[
                Icon(Icons.add_shopping_cart),
              ],
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: body(),
            ),
            _totalWidget()
          ],
        ),
      ),
    );
  }
}
