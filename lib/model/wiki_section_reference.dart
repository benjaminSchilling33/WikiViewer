import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class WikiSectionReference extends StatelessWidget {
  String referenceId;
  String referenceLink;
  String referenceText;

  WikiSectionReference({
    this.referenceId,
    this.referenceLink,
    this.referenceText,
  });
  factory WikiSectionReference.fromJson(var json) {
    return WikiSectionReference(
      referenceId: json['referenceId'],
      referenceLink: json['referenceLink'],
      referenceText: json['referenceText'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('[$referenceId] - '),
        Expanded(
          child: Linkify(
            onOpen: (link) async {
              if (await canLaunch(referenceLink)) {
                await launch(referenceLink);
              } else {
                throw 'Could not launch $link';
              }
            },
            text: "$referenceLink",
            style: TextStyle(),
          ),
        )
      ],
    );
  }
}
