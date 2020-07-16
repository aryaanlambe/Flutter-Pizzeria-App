import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

/*

  This package simply contains the data we map inside of our app.
  We have a pizza class.
  That pizza class has several attributes.
  Then we have Pizzalist class which expects a list of pizzas and then we define it all by creating a pizzaList instance of our PizzaList class.

*/

final databaseReference = Firestore.instance;
// Database reference for interfacing with Cloud Firestore according to Google's guidelines.

PizzaList pizzaList = PizzaList(pizzas: [
  Pizza(
    image: "assets/pizza.png",
    starRating: 4.5,
    name: "Buffalo Blue Cheese Chicken",
    desc:
    "Mozzarella Cheeze, Buffalo blue sauce, and your choice of grilled chicken or crispy chicken fingers",
    background: Color(0xfff2ca80),
    foreground: Colors.black,
    price: 13.00,
  ),
  Pizza(
    image: "assets/sweet_and_tangy.png",
    starRating: 4.5,
    name: "Sweet & Tangy Chicken",
    desc:
    "Mozzarella Cheeze, Buffalo blue sauce, and your choice of grilled chicken or crispy chicken fingers",
    background: Color(0xffd82a12),
    foreground: Colors.white,
    price: 12.99,
  ),
  Pizza(
    image: "assets/jamaican_jerk_veg.png",
    starRating: 4.5,
    name: "Jamaican \nJerk Veg",
    desc:
    "Mozzarella Cheeze, Buffalo blue sauce, and your choice of grilled chicken or crispy chicken fingers",
    background: Color(0xff4fc420),
    foreground: Colors.black,
    price: 12.99,
  ),
  Pizza(
    image: "assets/aussie_barbeque_veg.png",
    starRating: 4.5,
    name: "Aussie Barbeque Veg",
    desc:
    "Mozzarella Cheeze, Buffalo blue sauce, and your choice of grilled chicken or crispy chicken fingers",
    background: Color(0xff5d2512),
    foreground: Colors.white,
    price: 12.99,
  ),
  Pizza(
    image: "assets/indi_tandoori_paneer.png",
    starRating: 4.5,
    name: "Indi Tandoori Paneer",
    desc:
    "Mozzarella Cheeze, Buffalo blue sauce, and your choice of grilled chicken or crispy chicken fingers",
    background: Color(0xffdddbd8),
    foreground: Colors.black,
    price: 12.99,
  ),
  Pizza(
    image: "assets/african_peri_peri.png",
    starRating: 4.5,
    name: "African Saucy\nPeri Peri",
    desc:
    "Mozzarella Cheeze, Buffalo blue sauce, and your choice of grilled chicken or crispy chicken fingers",
    background: Color(0xffd54b1c),
    foreground: Colors.white,
    price: 12.99,
  ),
]);

class PizzaList {
  List<Pizza> pizzas;
  PizzaList({@required this.pizzas});
}

class Pizza {
  String image;
  Color background;
  Color foreground;
  String name;
  double starRating;
  String desc;
  double price;

  // getter & setter methods for aforementioned items:

  getImage(image){
    this.image = image;
  }

  getName(name){
    this.name = name;
  }

  getDesc(desc){
    this.desc = desc;
  }

  getPrice(price){
    this.price = price;
  }

  Pizza(
      {@required this.image,
        @required this.background,
        @required this.foreground,
        @required this.name,
        @required this.starRating,
        @required this.desc,
        @required this.price});
}

// Implementing use of pizza strings added above

class Details extends StatelessWidget {
  Details(this.pizzaObject);

  final Pizza pizzaObject;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(pizzaObject.background);
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                BackgroundArc(pizzaObject.background),
                ForegroundContent(pizzaObject: pizzaObject)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ForegroundContent extends StatelessWidget {
  const ForegroundContent({@required this.pizzaObject});

  final Pizza pizzaObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 70, left: 50),
            child: Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, size: 30),
              ),
            ),
          ),
        ),
        PizzaImage(pizzaObject.image),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.only(left: 105, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TitleText(pizzaObject.name),
              SizedBox(height: 20),
              StarRating(pizzaObject.starRating),
              SizedBox(height: 20),
              Description(pizzaObject.desc),
              SizedBox(height: 20),
              Price(pizzaObject.price),
              SizedBox(
                height: 20,
              ),
              BottomButtons(),
              SizedBox(
                height: 35,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Price extends StatelessWidget {
  final double price;

  const Price(this.price);

  @override
  Widget build(BuildContext context) {
    return Text(
      "\P   $price",
      style: TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
    );
  }
}

class BottomButtons extends StatefulWidget {
  @override
  _BottomButtonsState createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<BottomButtons> {
  bool isFav = false;
  bool isCart = false;

  // Code for entering Pizza chosen list into Cloud Firestore.


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFav = false;
    isCart = false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.black, width: 5))),
          child: FlatButton(
            onPressed: () {
                createRecord(); // runs below defined createRecord() method.
            },
            child: Text(

              "Add to cart",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
            ),
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            deleteData();
          },
          child: Icon(
            Icons.delete,
            color: Colors.red,
            size: 30.0,
          ),
          backgroundColor: Colors.white,
          elevation: 3,
        ),
      ],
    );
  }

  // Code for adding records into Cloud Firestore.
  void createRecord() async {
    await databaseReference.collection("pizzas");
    DocumentReference ref = await databaseReference.collection("pizzas")
        .add({
      // Store the following values in firebase database.
      'desc': 'UB Pizzeria',
      'image': 'UB Pizzeria',
      'name': 'UB Pizzeria',
      'price': 'UB Pizzeria',
      'quantity': 'UB Pizzeria',
      'toppings': 'UB Pizzeria',
      'toppings_list': 'UB Pizzeria'
    });
    print(ref.documentID);
  }
  void deleteData() {
    try {
      databaseReference
          .collection('pizzas')
          .document('OSyCxKRtybtfiaUv2RjB') // This is not selecting a dynamically generated documentID.
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }

} // End of _BottomButtonsState class.

class Description extends StatelessWidget {
  final String desc;

  const Description(this.desc);

  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      softWrap: true,
      style: TextStyle(
          color: Colors.black87,
          letterSpacing: 1.3,
          fontSize: 17,
          textBaseline: TextBaseline.alphabetic),
    );
  }
}

class StarRating extends StatelessWidget {
  final double rating;

  const StarRating(this.rating);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(rating.toString(),
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[600],
          size: 25,
        )
      ],
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText(this.pizzaName);

  final String pizzaName;
  final double _fontSize = 40;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: pizzaName,
            style: TextStyle(
                color: Colors.black,
                fontSize: _fontSize,
                fontFamily: "slabo",
                fontWeight: FontWeight.w500)),
        TextSpan(
            text: " Pizza",
            style: TextStyle(
                color: Colors.black,
                fontSize: _fontSize,
                fontFamily: "slabo",
                fontWeight: FontWeight.w600))
      ]),
    );
  }
}

class PizzaImage extends StatelessWidget {
  final String imageURI;

  const PizzaImage(this.imageURI);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: Image.asset(imageURI),
    );
  }
}

class BackgroundArc extends StatelessWidget {
  const BackgroundArc(this.background);

  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: BackgroundPainter(background),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  BackgroundPainter(this.color);

  final Color color;

  Path path = Path();

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint painter = Paint()..color = color;
    path.moveTo(250, 0);

    /*
      these are very absolute coordinates, and so aren't optimized when using the app in landscape mode.
    */

    path.quadraticBezierTo(150, 125, 240, 270);
    path.quadraticBezierTo(300, 345, 450, 350);

    path.lineTo(500, 0);

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
