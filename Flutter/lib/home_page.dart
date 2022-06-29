import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    //This size provides us total height and width of our screen
    //Use MediaQuery class's methods to get the size of the current media which contains your app
    var size, height, width;
    var urlImage = "assets/images/roger-federer-sneakers.jpeg";
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        // A text widget is required instead of a string
        title: Text('Sports App'),
      ),
      body:
          //The center widget will place its only child at the center position.
          Column(
              //The column widget will display its children in a vertical array.
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,

              //In case we need to use multiple widgets and arrange them vertically
              //=> Use a list of widgets.
              children: <Widget>[
            //Use the Padding() widget to apply padding/ margin
            Container(
              height: 110,
              child: Image.asset(
                "assets/images/primax_sport_logo.jpeg",
              ),
            ),

            Padding(
              //Apply padding by Left, Top, Right, Bottom
              padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
              child: Text(
                'FOR YOUR SPORT PASSION',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'Lato-Black'),
              ),
            ),
            CircleAvatar(
              radius: 120,
              child: ClipOval(
                child: Image.asset(
                  urlImage,
                  width: 400,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 0, 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'OUR PRODUCTS',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Lato-Black'),
                  ),
                )),

            //Using a seperated ListView widget to display items for higher performance than standard ListView
            Container(
              height: 150,
              child: ListView.separated(
                //This line of code will override the default vertical direction and change it to horizontal direction
                scrollDirection: Axis.horizontal,
                //Creating a list of card items and wrap them with size boxes to direct them with a specific size
                //The seperatorBuilder and itemBuilder properties of the ListView.seperated constructor will render the
                // visible children and seperate them
                itemCount: 4,
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 12,
                ),
                itemBuilder: (BuildContext context, int index) => buildCard(),
              ),
            )
          ]),
    );
  }

  Widget buildCard() => Container(
      width: 150,
      height: 150,
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            "assets/images/wimbledon-shoes.jpeg",
            fit: BoxFit.cover,
          ),
          Text(
            "Product Name",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Lato-Black',
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
          Text(
            "Price",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Lato-Regular',
                fontWeight: FontWeight.normal,
                fontSize: 12),
          ),
        ],
      ));
}
