import 'package:flutter/material.dart';

class Comment {
  final String author;
  final String body;
  Comment(this.author, this.body);
}

class CityInfoArgs {
  String city;
  String state;
  String imageURL;
  String country;
  List<Comment> comments;

  CityInfoArgs({
    this.city,
    this.state,
    this.imageURL,
    this.country,
    this.comments,
  });
}

class CityInformationScreen extends StatefulWidget {
  @override
  _CityInformationScreenState createState() => _CityInformationScreenState();
}

class _CityInformationScreenState extends State<CityInformationScreen> {

  String commentTextFieldText = "";

  @override
  Widget build(BuildContext context) {
    final CityInfoArgs args = ModalRoute.of(context).settings.arguments;


    TextEditingController controller = TextEditingController();

    void addComment(String comment) {
      args.comments.add(Comment("Me",comment));
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(args.city),
      ),
      body: ListView(
        children: <Widget>[
          Image.network(
            args.imageURL,
            height: 100,
            fit: BoxFit.cover,
          ),
          Card(
            margin: EdgeInsets.all(16),
            child: Column(children: [
              ListTile(
                leading: Icon(Icons.place),
                title: Text("State/Municipality"),
                trailing: Text(args.state),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.language),
                title: Text("Country"),
                trailing: Text(args.country),
              )
            ]),
          ),
          ExpansionTile(
              title: Text("Comments"),
              initiallyExpanded: true,
              children: [
                Card(
                  margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Column(
                    children: [
                      ListView.builder(
                          itemCount: args.comments.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              key: Key(index.toString()),
                              title: Text(args.comments[index].author),
                              subtitle: Text(args.comments[index].body),
                            );
                          }),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextField(
                                  controller: controller,
                                  onChanged: (String text) {
                                    this.commentTextFieldText = text;
                                  },
                                  onSubmitted: (String text) {
                                    addComment(this.commentTextFieldText);
                                    controller.clear();
                                  },
                            )),
                            FlatButton(
                              child: Text("Post"),
                              onPressed: () {
                                this.setState(() {
                                  addComment(this.commentTextFieldText);
                                  controller.clear();
                                });
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}
