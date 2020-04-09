import 'package:delivery/data/data.dart';
import 'package:delivery/model/order.dart';
import 'package:flutter/material.dart';

class RecentOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Recents Order",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          height: 120,
          child: ListView.builder(
              padding: EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders.length,
              itemBuilder: (BuildContext context, int index) {
                Order order = currentUser.orders[index];
                return _buildRecentOrders(context,order);
              }),
        ),
      ],
    );
  }

  _buildRecentOrders(BuildContext context,Order order) {
    return Container(
      width: 320,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.grey[200]),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            child: Image(
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              image: AssetImage(order.food.imageUrl),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(order.food.name,style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),),
                  SizedBox(height: 4,),
                  Text(order.restaurant.name,style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  ),overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 4,),
                  Text(order.date,style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  ),overflow: TextOverflow.ellipsis)
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 48,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30)
              ),
            child: IconButton(
              iconSize: 30,
              color: Colors.white,
              icon: Icon(Icons.add), onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
