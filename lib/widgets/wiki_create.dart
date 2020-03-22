import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wiki_viewer/model/wiki.dart';

class WikiCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Wiki(),
    );
  }
}
