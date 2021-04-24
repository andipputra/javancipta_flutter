import 'package:flutter/material.dart';
import 'package:graphite/core/matrix.dart';
import 'package:graphite/graphite.dart';
import 'package:javancipta_flutter/repository/repository.dart';

class TreePage extends StatefulWidget {
  @override
  _TreePageState createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> {
  var repo = Repository();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: FutureBuilder(
          future: repo.getDataTree(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DirectGraph(
                list: snapshot.data,
                cellWidth: 136.0,
                cellPadding: 24.0,
                contactEdgesDistance: 10.0,
                orientation: MatrixOrientation.Vertical,
              );
            }

            return CircularProgressIndicator();
          }),
    );
  }
}