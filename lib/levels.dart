import 'package:flutter/material.dart';
import 'dart:convert';

class LevelsPage extends StatefulWidget {
  @override
  State<LevelsPage> createState() => new LevelsPageState();
}

class LevelsPageState extends State<LevelsPage> {
  // List<Widget> idioms = List();

  // setIdioms(List<String> data) {
  //   setState(() {
  //     var idioms = this.idioms;
  //     idioms.clear();
  //     for (var idiom in data) {
  //       idioms.add(new Center(
  //         child: new Text(idiom),
  //       ));
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/Idioms.json'),
        builder: (context, snapshot) {
          var mydata = json.decode(snapshot.data.toString());
          print(mydata);
          return ListView.builder(
            itemBuilder: (BuildContext context, int idx) {
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(mydata[idx]),
                  ],
                ),
              );
            },
            itemCount: mydata == null ? 0 : mydata.length,
            // itemCount: 50,
          );
        },
      ),
    );
  }
  
}
