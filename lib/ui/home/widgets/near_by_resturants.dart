import 'package:delivery/data/data.dart';
import 'package:delivery/model/restaurant.dart';
import 'package:delivery/ui/home/widgets/rating.dart';
import 'package:delivery/ui/resturant/restaurant_screen.dart';
import 'package:flutter/material.dart';

class NearByResturants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Nearby Restaurants",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          _buildNearbyRestaurant(context),
        ],
      ),
    );
  }

  _buildNearbyRestaurant(BuildContext context) {
    List<Widget> widgets = [];
    restaurants.forEach((Restaurant resturant) {
      widgets.add(
        GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => RestaurantScreen(resturant))),
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey[200], width: 1)),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  child: Hero(
                    child: Image(
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                      image: AssetImage(resturant.imageUrl),
                    ),
                    tag: resturant.imageUrl,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          resturant.name,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Ratings(resturant.rating),
                        SizedBox(height: 4),
                        Text(resturant.address,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                            overflow: TextOverflow.ellipsis),
                        SizedBox(height: 4),
                        Text("0.2 miles away",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
    return Column(children: widgets);
  }
}
