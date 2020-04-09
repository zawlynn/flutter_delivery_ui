import 'package:delivery/data/data.dart';
import 'package:delivery/ui/cart/cart_screen.dart';
import 'package:delivery/ui/home/widgets/near_by_resturants.dart';
import 'package:delivery/ui/home/widgets/recent_orders.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {},
        ),
        title: Text("Food Delivery"),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => CartScreen(currentUser))),
            child: Text(
              "Cart (${currentUser.cart.length})",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 20),
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 0.8,
                        ),
                      ),
                      hintText: "Search food or  Restaurants ",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {},
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                      )),
                ),
              ),
              RecentOrders(),
              NearByResturants(),
            ],
          )
        ],
      ),
    );
  }
}
