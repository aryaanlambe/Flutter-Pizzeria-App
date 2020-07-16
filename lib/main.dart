import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:ubpizzeria/sign_in.dart';
import 'details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// All imports

void main() => runApp(MyApp());

// This block of code starts the application on target device.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pizza App",
      home: loginPage(),
      theme: ThemeData(primarySwatch: Colors.blueGrey, fontFamily: "slabo"),
    );
  }
}
// This block of code is for starting the main page of app
class PizzaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xff000000));
    return Scaffold(
      body: MainApp(),
      bottomNavigationBar: BottomBar(),
    );
  }
}

// This block of code is defining the shopping cart screen.
class shoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shopping Cart Screen Placeholder"),
        ),
    );}
}
// This class defines and starts the custom pizza screen once user clicks on button in main page
class customPizza extends StatelessWidget {
  int _selectedIndex = 0;
  // showing the screens on left hand navigation bar.
  List<Widget> screens = [Base(), Crest(), Toppings(), SpicesnHerbs()];

  @override
  Widget build(BuildContext context) {
    // Safe area is used for making sure all widgets in this screen aren't out of bounds.
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: <Widget>[
            NavigationRail(
              backgroundColor: Colors.black,
              selectedIndex: _selectedIndex,
              selectedLabelTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 1.0,
                  decoration: TextDecoration.underline),
              unselectedLabelTextStyle: TextStyle(color: Colors.white),
              onDestinationSelected: (int index) {
              },
              groupAlignment: 1.0,
              labelType: NavigationRailLabelType.all,
              leading: Column(
                
              ),
              destinations: [
                NavigationRailDestination(
                    icon: SizedBox.shrink(),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          "Pizza Base",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
                NavigationRailDestination(
                    icon: SizedBox.shrink(),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          "Pizza Crest",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
                NavigationRailDestination(
                    icon: SizedBox.shrink(),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          "Pizza Toppings",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
                NavigationRailDestination(
                    icon: SizedBox.shrink(),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          "+ Spices & Herbs",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ))
              ],
            ),
            Expanded(child: screens[_selectedIndex])
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // No onpressed function content.
        },
        label: Text('Add to Cart'),
        icon: Icon(Icons.shopping_basket),
        backgroundColor: Colors.pink,
      ),
      ),
    );
  }
}
class Base extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: ListView(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, size: 35, color: Colors.white)),
            SizedBox(width: 10),
          ]),
          Text(
            "Choose a base.",
            style: TextStyle(
                fontSize: 38, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('assets/pizza_1.png')),
          Divider(color: Colors.transparent, height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('assets/pizza_2.jpg')),
          Divider(color: Colors.transparent, height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('assets/pizza_3.png')),
          Divider(color: Colors.transparent, height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('assets/pizza_1.jpg')),
        ],
      ),
    );
  }
}

class Crest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: ListView(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, size: 35, color: Colors.white)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart, size: 35, color: Colors.white)),
            SizedBox(width: 10),
          ]),
          Text(
            "Newest",
            style: TextStyle(
                fontSize: 38, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('newest/n1.jpg')),
          Divider(color: Colors.transparent, height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('newest/n2.jpg')),
          Divider(color: Colors.transparent, height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('newest/n3.jpg')),
          Divider(color: Colors.transparent, height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('newest/n4.jpg')),
          Divider(color: Colors.transparent, height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('newest/n5.jpg')),
          Divider(color: Colors.transparent, height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('newest/n6.jpg')),
          Divider(color: Colors.transparent, height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('newest/n8.jpg')),
        ],
      ),
    );
  }
}

class Toppings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Toppings",
          style: TextStyle(
              fontSize: 38, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class SpicesnHerbs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sugar",
            style: TextStyle(
                fontSize: 38, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 50),
          Text(
            "Spice",
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "And Everything",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            "Nice",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

//Everything defined below this point is for defining the MainApp and wchich widgets fall part of it.

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                titleBar(),
                tabs(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget titleBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Text(
            "UB Pizzeria",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),
          ),
        ],
      )
    ],
  );
}

Widget tabs() {
  return Container(
    height: 600,
    width: double.infinity,
    child: DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(-10),
            child: Container(
              color: Colors.transparent,

                child: Column(
                  children: <Widget>[
                    TabBar(
                      isScrollable: true,
                      labelPadding: EdgeInsets.only(top: 15),
                      indicatorColor: Colors.transparent,
                      labelColor: Colors.black,
                      labelStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          fontFamily: "slabo"),
                      unselectedLabelColor: Colors.black26,
                      unselectedLabelStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w200,
                          fontFamily: "slabo"),
                      tabs: <Widget>[
                        Container(
                          child: Text("Choose a pizza you like!"),
                        ),

                      ],
                    )
                  ],
                ),

            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            pizzaShowCase(),
          ],
        ),
      ),
    ),
  );
}

Widget pizzaShowCase() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 20),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: pizzaList.pizzas.length,
      itemBuilder: (BuildContext context, int i) {
        return ListOfPizzas(
          name: pizzaList.pizzas[i].name,
          image: pizzaList.pizzas[i].image,
          price: pizzaList.pizzas[i].price,
          background: pizzaList.pizzas[i].background,
          foreground: pizzaList.pizzas[i].foreground,
          pizzaObject: pizzaList.pizzas[i],
        );
      },
    ),
  );
}

class ListOfPizzas extends StatelessWidget {
  const ListOfPizzas(
      {@required this.foreground,
      @required this.background,
      @required this.price,
      @required this.name,
      @required this.image,
      @required this.pizzaObject});

  final Color foreground;
  final Color background;
  final double price;
  final String name;
  final String image;
  final Pizza pizzaObject;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Details(pizzaObject)));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            width: 225,
            height: 410,
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 180,
                  child: Image.asset(image),
                ),
                SizedBox(
                  height: 30,
                ),
                RichText(
                  softWrap: true,
                  text: TextSpan(
                      style: TextStyle(
                          color: foreground, fontSize: 25, fontFamily: "slabo"),
                      children: [
                        TextSpan(text: name),
                        TextSpan(
                            text: "\nPizza",
                            style: TextStyle(fontWeight: FontWeight.w800))
                      ]),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("\P $price",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: foreground,
                              fontFamily: "arial")),
                    ),
                    StatefulFavIcon(
                      foreground: foreground,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 40,
        )
      ],
    );
  }
}

class StatefulFavIcon extends StatefulWidget {
  const StatefulFavIcon({@required this.foreground});

  final Color foreground;

  @override
  _StatefulFavIconState createState() => _StatefulFavIconState();
}

class _StatefulFavIconState extends State<StatefulFavIcon> {
  bool isFav;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFav = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFav = !isFav;
        });
      },
      child: Icon(
        isFav ? Icons.favorite : Icons.favorite_border,
        color: widget.foreground,
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  final double _size = 60;
  final double _padding = 18;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(

      color: Colors.transparent,
      elevation: 0.0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[
            Container(
              height: _size + 15,
              width: _size + 15,
              padding: EdgeInsets.all(_padding),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
                // Hard-coded profile image.
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                    "https://vignette.wikia.nocookie.net/joke-battles/images/7/74/Noseybonk.jpg/revision/latest?cb=20170523214048",
                    fit: BoxFit.fill),

              ),
            ),
            Container(
              height: _size,
              width: _size,
              padding: EdgeInsets.all(_padding),
              child: Image.asset(
                "assets/home_icon.png",
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: _size,
              width: _size,
              padding: EdgeInsets.all(_padding),
              child: Image.asset(
                "assets/search_icon.png",
                fit: BoxFit.contain,
              ),
            ),
            IconButton(icon: Icon(Icons.local_pizza), onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => customPizza()),
              );

            },),

            IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => shoppingCart()),
              );

            },),

          ],
        ),
      ),
    );
  }



}
// Login Page (has been set as home[startup page] from above)

class loginPage extends StatefulWidget {
  @override
  loginPageState createState() => new loginPageState();
}
class loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 90.0, 0.0, 0.0),
                    child: Text('UB',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 165.0, 0.0, 0.0),
                    child: Text('Pizzeria',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(260.0, 165.0, 0.0, 0.0),
                    child: Text('.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50.0),
                    SizedBox(height: 40.0),
                    SizedBox(height: 20.0),
                    Container(
                      height: 60.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blue,
                                style: BorderStyle.solid,
                                width: 1.0),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            Center(
                              child:
                              ImageIcon(AssetImage(
                                  'assets/icons8-google-48.png')),
                            ),
                            SizedBox(width: 10.0),

                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  signInWithGoogle().whenComplete(() {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return PizzaHome();
                                        },
                                      ),
                                    );
                                  });


                                },
                              child: Text('Sign in with Google',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                      fontFamily: 'Montserrat')),
                            )
                            )

                          ],
                        ),
                        
                      ),
                    )
                  ],
                )),
            SizedBox(height: 210.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Want to hear a joke about Pizza?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 4.0),
                InkWell(
                  child: Text(
                    'Nevermind, It\'s too cheesy',
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                )
              ],
            )
          ],

        ));
  }

}
