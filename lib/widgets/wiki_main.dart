import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wiki_viewer/provider/wiki_provider.dart';
import 'package:wiki_viewer/widgets/wiki_create.dart';

class WikiMain extends StatelessWidget {
  String appTitle;

  WikiMain({this.appTitle});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WikiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('$appTitle'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: FlatButton(
              child: Text('Import Wiki'),
            ),
          ),
          Container(
            child: Expanded(
              child: provider.wikiData,
            ),
          ),
        ],
      ),
      floatingActionButton: Ink(
        decoration: ShapeDecoration(
          color: Color(0xff344955),
          shape: CircleBorder(),
        ),
        child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WikiCreate();
                  },
                ),
              );
            }),
      ),
    );
  }
}
