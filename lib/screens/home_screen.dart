import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/models/order.dart';
import 'package:food_delivery/screens/cart_screen.dart';
import 'package:food_delivery/screens/restaurant_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.account_circle,
            size: 30.0,
          ),
        ),
        title: const Text('Food Delivery'),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CardScreen())),
            child: const Text(
              'Cart (5)',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 2,
                  color: Colors.green.shade400,
                )),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: 'Search Food or Restaurants',
                  contentPadding: const EdgeInsets.only(left: 20, top: 10),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.clear),
                  )),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              'Recent Orders',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          SizedBox(
            width: double.infinity,
            height: 100,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemCount: currentUser.orders.length,
                itemBuilder: (context, index) {
                  Order order = currentUser.orders[index];
                  return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width * .8,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                        // color: Colors.green,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image(
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              image: AssetImage(order.food.imageUrl),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                order.food.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                order.restaurant.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                order.date,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            // margin: const EdgeInsets.only(left: 10),
                            width: 40,
                            height: 40,
                            child: IconButton(
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ));
                }),
          ),
          const SizedBox(height: 5.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              'Nearly Restaurants',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RestaurantDetailScreen(
                            restaurant: restaurants[index],
                          ),
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15)),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                fit: BoxFit.cover,
                                width: 120,
                                height: 120,
                                image: AssetImage(restaurants[index].imageUrl),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  restaurants[index].name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    ...star(),
                                  ],
                                ),
                                Text(
                                  restaurants[index].address,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const Text(
                                  '0.2 miles away',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }

  List<Widget> star() {
    return restaurants.map((e) => const Icon(Icons.star)).toList();
  }
}
