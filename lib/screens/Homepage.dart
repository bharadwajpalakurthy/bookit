import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookit/helper.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    List<CusCard> movies = List();
    movies.add(CusCard("https://images-na.ssl-images-amazon.com/images/I/71rNJQ2g-EL._SY606_.jpg", "Moon Light", "Drama", 4, 10, 1));
    movies.add(CusCard("https://cdn11.bigcommerce.com/s-ydriczk/images/stencil/1280x1280/products/88314/91406/Blade-Runner-2049-Final-Style-Poster-buy-original-movie-posters-at-starstills__83407.1519904794.jpg?c=2?imbypass=on", "Blade Runner 2049", "Adventure", 1, 1.99, 2));
    movies.add(CusCard("https://images.hellogiggles.com/uploads/2017/10/05121546/tomb-raider.jpg", "Tomb Raider", "Action",
        2, 4.99, 1));
    movies.add(CusCard("https://images-na.ssl-images-amazon.com/images/I/51J4w08ROJL.jpg", "Wonder Woman", "Adventure", 5, 14.99, 3));

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          title: Text(
            widget.title,
            style: TextStyle(fontSize: 16),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 500,
            child: ListView.separated(
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: MySeparator(
                  color: Colors.black26,
                ),
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return movies[index];
              },
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Column(crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Divider(
                  color: Colors.black26,
                ),
                Text(
                  "Total\t\t\t \$112",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          Spacer(flex: 1),
          SizedBox(
            width: 326,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: RaisedButton(
                onPressed: () {},
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                color: Color(0xFF0C0C0C),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Buy now",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.shopping_basket,
                          size: 18,
                        ),
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CusCard extends StatelessWidget {
  String url, title, author;
  int rating, units;
  double price;
  CusCard(
      this.url, this.title, this.author, this.rating, this.price, this.units);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Container(
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
                Text(
                  "\$ $price",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(
                  height: 30,
                ),
                Text("X$units",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14))
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
