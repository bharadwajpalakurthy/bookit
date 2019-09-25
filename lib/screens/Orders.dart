import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:bookit/helper.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<RolCard> books = List();

    books.add(RolCard(
      "https://images-na.ssl-images-amazon.com/images/I/71Q1Iu4suSL._SY606_.jpg",
      "Harry Potter",
      "J. K. Rowling",
      5,
      65,
    ));

    books.add(RolCard(
      "https://bookriot.com/wp-content/uploads/2017/09/fahrenheit-451-flamingo-edition.jpg",
      "Fahrenheit 451",
      "Ray Bradbury",
      3,
      34,
    ));
    books.add(RolCard(
      "https://m.media-amazon.com/images/M/MV5BZjY3MmQzYzItMzRmNC00NWQyLWJjYjgtNzEzNTBlMTllYjRkXkEyXkFqcGdeQXVyNjg3MDMxNzU@._V1_QL50_.jpg",
      "Catch-22",
      "Joseph Heller",
      4,
      50,
    ));
    books.add(RolCard(
      "https://images-na.ssl-images-amazon.com/images/I/918KkftCUFL.jpg",
      "13 reasons why",
      "Jay Asher",
      2,
      86,
    ));

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              color: Color(0xffFFCE32),
              height: 80,
            ),
            Container(
              height: 48,
              margin: EdgeInsets.fromLTRB(20, 56, 20, 20),
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: TextField(
                      decoration:
                          InputDecoration.collapsed(hintText: "Search Books"),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.search))
                ],
              ),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    spreadRadius: 5,
                    offset: Offset(0, 2),
                    blurRadius: 5)
              ], borderRadius: BorderRadius.circular(50), color: Colors.white),
            ),
          ]),
          Image.asset("assets/hero.png"),
          Expanded(
            child: ListView.separated(separatorBuilder: (context, index) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40),
    child: MySeparator(
    color: Colors.black26,
    ),
    ),
              itemCount: books.length, itemBuilder: (context,index){
              return books[index];
            }
              ,
            ),
          )
        ],
      ),
    );
  }
}

class RolCard extends StatelessWidget {
  final String url, title, author;
  final int rating;
  final double percent;
  bool selected = false;

  RolCard(this.url, this.title, this.author, this.rating, this.percent);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(selected ? 0.04 : 0.0),
                spreadRadius: selected ? 6 : 0.0,
                blurRadius: 12.0,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  child: Image.network(url, height: 100.0),
                  borderRadius: BorderRadius.circular(8),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      author,
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black26,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    starRating(rating)
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 30,
                  width: 30,
                  child: Icon(
                    Icons.play_arrow,
                    size: 20,
                    color: Color(0xffFFCE32),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8)),
                ),
                SizedBox(
                  height: 30,
                ),
                CircularPercentIndicator(
                  radius: 30,
                  lineWidth: 2,
                  progressColor: Color(0xffFFCE32),
                  percent: percent/100,
                  backgroundColor: Colors.black.withOpacity(0.07),
                  center: Text(
                    percent.round().toString() + "%",
                    style: TextStyle(fontSize: 7),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget starRating(int value) {
    List<Widget> stars = List(5);
    for (int i = 0; i < 5; i++) {
      stars[i] = Icon(
        Icons.star,
        color: i < value ? Color(0xffFFCE33) : Color(0xffECECEC),
        size: 18,
      );
    }
    return Row(
      children: stars,
    );
  }
}
