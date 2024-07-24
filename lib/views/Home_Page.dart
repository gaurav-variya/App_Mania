import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../utills/product_utills.dart';
import 'Extension_Page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _homePageState();
}

class _homePageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('fav_page');
            },
            icon: const Icon(
              Icons.favorite_outlined,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('Meal_Page');
            },
            icon: const Icon(
              Icons.fastfood_outlined,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: allRecipies
                    .map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      20.toHeight(),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('detail_page', arguments: e);
                        },
                        child: Container(
                          height: 275,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(3, 3),
                                blurRadius: 5,
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                e['image'],
                                fit: BoxFit.fill,
                              ),
                              Text(
                                e['name'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              RatingBar.builder(
                                initialRating: e['rating'].toDouble(),
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 15,
                                itemPadding: const EdgeInsets.symmetric(
                                    horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              10.toHeight(),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (!favitems.contains(e)) {
                                        favitems.add(e);
                                      }
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (!mealitems.contains(e)) {
                                        mealitems.add(e);
                                      }
                                    },
                                    child: Text("Add To Meal"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
                    .toList(),
              ),
            ),
            const Spacer(),
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(5, 5),
                    blurRadius: 5,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}