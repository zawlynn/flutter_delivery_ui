import 'package:delivery/model/order.dart';
import 'package:delivery/model/user.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final User user;

  CartScreen(this.user);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart (${widget.user.cart.length})"),
      ),
      body: ListView.separated(
        itemCount: widget.user.cart.length,
        itemBuilder: (BuildContext context, int index) {
          Order order = widget.user.cart[index];
          return _buildOrderItem(order);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1,
            color: Colors.grey,
          );
        },
      ),
    );
  }

  _buildOrderItem(Order order) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              ClipRRect(
                child: Image(
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                  image: AssetImage(order.food.imageUrl),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    order.food.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    order.restaurant.name,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              "-",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Text(order.quantity.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Text("+",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Text("\$${order.quantity * order.food.price}"),
        ],
      ),
    );
  }
}
