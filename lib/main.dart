import 'package:flutter/material.dart';
import 'dart:math';
import 'CityInformation.dart';

void main() => runApp(MainApp());

//Testing Github File Changes

class MainApp extends StatelessWidget {
  static const String _title = 'Eschers Hello World';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        home: HomeWidget(),
        routes: <String, WidgetBuilder>{
          "/infoScreen": (BuildContext context) => CityInformationScreen(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          secondaryHeaderColor: Colors.deepPurpleAccent,
          accentColor: Colors.deepPurpleAccent,
          buttonColor: Colors.deepPurple,
        ));
  }
}

var cities = [
  CityInfoArgs(
    city: "Portland",
    state: "Oregon",
    imageURL:
        "https://media-cdn.tripadvisor.com/media/photo-s/01/63/66/28/portland-or-with-mt-hood.jpg",
    country: "United States",
    comments: [],
  ),
  CityInfoArgs(
    city: "Anchorage",
    state: "Alaska",
    imageURL:
        "https://www.adn.com/resizer/0U06pcHV8ihQiM9t2DzlzY3VL4g=/1200x0/s3.amazonaws.com/arc-wordpress-client-uploads/adn/wp-content/uploads/2018/02/02073625/180202-aerials-0216.jpg",
    country: "United States",
    comments: [
      Comment("fartDestr0yer69", "Quaint location, quite lovely"),
      Comment("Escher Wright-Dykhouse",
          "Great city with great people. Would give 5/5 stars.")
    ],
  ),
  CityInfoArgs(
    city: "Nuuk",
    state: "Sermersooq",
    imageURL:
        "https://i.pinimg.com/originals/2b/fa/81/2bfa81cf5e790dd0d8b2570f0d5e41ba.jpg",
    country: "Greenland",
    comments: [],
  )
];

List<CustomCardView> cityArgsToCards(List<CityInfoArgs> infoArgs) {
  List<CustomCardView> cards = [];
  for (CityInfoArgs infoArg in infoArgs) {
    cards.add(CustomCardView(infoArg));
  }
  return cards;
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World"),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 16, bottom: 16.0),
        children: <Widget>[
              Container(
                height: 75,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 8, right: 8),
                  children: new List.generate(12, (i) => RoundRowItem()),
                ),
              ),
            ] +
            cityArgsToCards(cities),
      ),
      drawer: Drawer(
        child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 80), child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text("Dark Mode"),
                      subtitle: Text("Use switch to toggle"),
                      trailing: Switch(
                        value: false,
                        onChanged: (bool value) {},
                      ),
                    )
                  ],
                )),
                Container(color: Colors.deepPurple, height: 100),
                Container(
                    padding: EdgeInsets.only(top: 24),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("images/shiba.jpg"),
                      ),
                      title: Text("Escher Wright-Dykhouse",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      subtitle: Text("CEO/Founder of escherTalks",
                          style: TextStyle(
                            color: Colors.white54,
                          )),
                    )),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
      ),
    );
  }
}

class CustomCardView extends StatefulWidget {
  final CityInfoArgs place;

  CustomCardView(this.place);

  @override
  _CustomCardViewState createState() => _CustomCardViewState();
}

class _CustomCardViewState extends State<CustomCardView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: GestureDetector(
        onTapUp: (details) {
          Navigator.of(context)
              .pushNamed("/infoScreen", arguments: this.widget.place);
        },
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.add_location),
                title: Text(this.widget.place.city),
                subtitle: Text(
                    this.widget.place.state + ", " + this.widget.place.country),
              ),
              Image.network(this.widget.place.imageURL),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundRowItem extends StatefulWidget {
  @override
  _RoundRowItemState createState() => _RoundRowItemState();
}

class _RoundRowItemState extends State<RoundRowItem> {
  List colors = [
    Colors.purple,
    Colors.deepPurple,
    Colors.yellow,
    Colors.blue,
    Colors.pink
  ];
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
              color: colors[random.nextInt(5)],
              borderRadius: BorderRadius.all(Radius.circular(50)),
              border: Border.all(
                color: Colors.white.withAlpha(80),
                width: 4,
                style: BorderStyle.solid,
              )),
          child: FlatButton(onPressed: () {
            print("clicked something");
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text("Congratulations"),
                    content: Text("you did something!"),
                    actions: [
                      FlatButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ]);
              },
            );
          })),
    );
  }
}
