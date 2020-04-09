import 'package:delivery/model/food.dart';
import 'package:delivery/model/restaurant.dart';
import 'package:delivery/ui/home/widgets/rating.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantScreen(this.restaurant);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resturants"),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Hero(
                  child: Image(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    fit: BoxFit.cover,
                    image: AssetImage(widget.restaurant.imageUrl),
                  ), tag: widget.restaurant.imageUrl,
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: IconButton(
                  color: Theme.of(context).primaryColor,
                  iconSize: 30,
                  icon: Icon(Icons.favorite),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.restaurant.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "0.2 miles away",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Ratings(widget.restaurant.rating),
                SizedBox(
                  height: 4,
                ),
                Text(
                  widget.restaurant.address,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        child: Text(
                          "Review",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: Text(
                          "Contact",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "Menu",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(widget.restaurant.menu.length, (index) {
                  Food food = widget.restaurant.menu[index];
                  return _buildMenuItem(food);
                }),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildMenuItem(Food menu) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[200], width: 1),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(menu.imageUrl))),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black45.withOpacity(0.3),
                      Colors.black87.withOpacity(0.3),
                      Colors.black12.withOpacity(0.3),
                    ]),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    menu.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text("\$${menu.price}",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 18,
                  ),),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
