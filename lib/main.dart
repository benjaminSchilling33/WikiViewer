import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wiki_viewer/model/wiki_data.dart';
import 'package:wiki_viewer/provider/wiki_provider.dart';
import 'package:wiki_viewer/widgets/wiki_main.dart';

void main() => runApp(ThemeWrapper());

class ThemeWrapper extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Color(0xFF0697F3),
        tabBarTheme: TabBarTheme(
          indicator: UnderlineTabIndicator(),
        ),
        scaffoldBackgroundColor: Color(0xFF0697F3),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xff344955),
          foregroundColor: Color(0xff344955),
        ),
        primaryColorDark: Color(0xFF700A66),
        indicatorColor: Color(0xff344955),
        accentColor: Color(0xFFF5E929),
        textTheme: TextTheme(
          title: TextStyle(
            color: Color(0xFFF70B6F),
          ),
          body1: TextStyle(
            color: Color(0xFFF70B6F),
          ),
          body2: TextStyle(
            color: Color(0xFFF70B6F),
          ),
          subtitle: TextStyle(
            color: Color(0xFFF70B6F),
          ),
          subhead: TextStyle(
            color: Color(0xFFF70B6F),
          ),
          display1: TextStyle(
            color: Color(0xFFF70B6F),
          ),
          caption: TextStyle(
            color: Color(0xFFF70B6F),
          ),
          overline: TextStyle(
            color: Color(0xFFF70B6F),
          ),
          headline: TextStyle(
            color: Color(0xFFF70B6F),
          ),
        ),
        cardColor: Color(0xFF44BD0D),
        appBarTheme: AppBarTheme(
          color: Color(0xFFF8AE1D),
          iconTheme: IconThemeData(
            color: Color(0xFF0697F3),
          ),
        ),
        iconTheme: IconThemeData(
          color: Color(0xFFF70B6F),
        ),
        toggleableActiveColor: Color(0xFF0967F3),
      ),
      home: WikiViewer(),
    );
  }
}

class WikiViewer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => WikiProvider(context),
      child: Consumer<WikiProvider>(
        builder: (context, wikiProvider, child) => FutureBuilder<WikiData>(
          future: wikiProvider.futureWikiData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              wikiProvider.initializeProvider(snapshot.data);
              return MaterialApp(
                theme: Theme.of(context),
                home: WikiMain(
                  appTitle: 'WikiViewer',
                ),
              );
            } else {
              return new MaterialApp(
                theme: Theme.of(context),
                title: 'WikiViewer',
                home: new Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Container(
                          child: Text('Loading Wiki Data'),
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
