import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'CityInformation.dart';

class AddCityPage extends StatefulWidget {
  @override
  _AddCityPageState createState() => _AddCityPageState();
}

class _AddCityPageState extends State<AddCityPage> {
  CityInfoArgs createdCity = CityInfoArgs(
      state: "", city: "", country: "", imageURL: "", comments: []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New City"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: () {
                  if (createdCity.city != "" &&
                      createdCity.state != "" &&
                      createdCity.country != "") {
                    createdCity.imageURL = (createdCity.imageURL != "")
                        ? createdCity.imageURL
                        : "https://images.wallpaperscraft.com/image/city_blur_glare_115698_1920x1080.jpg";
                    Navigator.of(context).pop(createdCity);
                  } else {}
                })
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: TextField(
                onChanged: (String value) {
                  createdCity.city = value;
                },
                autofocus: true,
                decoration: const InputDecoration(
                  hasFloatingPlaceholder: true,
                  hintText: "Ex: Ottawa",
                  labelText: "City Name",
                  icon: Icon(Icons.place),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: TextField(
                onChanged: (String value) {
                  createdCity.state = value;
                },
                decoration: const InputDecoration(
                  hasFloatingPlaceholder: true,
                  hintText: "Ex: Ontario",
                  labelText: "State/Provice/Municipality",
                  icon: Icon(Icons.assistant_photo),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: TextField(
                onChanged: (String value) {
                  createdCity.country = value;
                },
                decoration: const InputDecoration(
                  hasFloatingPlaceholder: true,
                  hintText: "Ex: Canada",
                  labelText: "Country",
                  icon: Icon(Icons.language),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: TextField(
                onChanged: (String value) {
                  createdCity.imageURL = value;
                },
                decoration: const InputDecoration(
                  hasFloatingPlaceholder: true,
                  hintText: "Ex: https://escherwd.com/canada.jpg",
                  labelText: "Image URL (Optional)",
                  icon: Icon(Icons.image),
                ),
              ),
            )
          ],
        ));
  }
}
