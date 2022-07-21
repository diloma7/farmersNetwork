import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class DialogPolicy extends StatelessWidget {
  final double radius;
  final String mdFilename;

  DialogPolicy({
    Key? key,
    this.radius = 8,
    required this.mdFilename,
  })  : assert(mdFilename.contains('.md')),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Column(
        children: [
          Text("Privacy Policy"),
          Expanded(
            child: FutureBuilder(
              future: Future.delayed(Duration(milliseconds: 150)).then((value) {
                return rootBundle.loadString('assets/$mdFilename');
              }),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Markdown(data: snapshot.data.toString());
                } else {
                  return Center(
                    child: Text("Loading ..."),
                  );
                }
              },
            ),
          ),
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(), child: Text("Exit"))
        ],
      ),
    );
  }
}
