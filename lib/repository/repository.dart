import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:graphite/core/typings.dart';
import 'package:javancipta_flutter/models/person.dart';

class Repository {
  var dio = Dio(); // with default Options

  Future<List<Person>> getAllPerson() async {
    Response response;

    var listPerson = <Person>[];

    try {
      response = await dio.get('http://localhost:3000/person/all');

      var res = jsonDecode(jsonEncode(response.data));
      print(res);

      res.forEach((element) {
        listPerson.add(
          Person.fromJson(element)
        );
       });
      
    } catch (e) {
      print(e);
    }

    return listPerson;
  }

  Future<List<NodeInput>> getDataTree() async {
    var data = await getAllPerson();

    print(data);

    var listData = <NodeInput>[];

    if (data.isNotEmpty) {
      data.forEach((person) {
        List<String> nextStr = [];
        data.forEach((p2) {
          if (p2.parent == person.name) {
            nextStr.add(p2.name);
          }
        });
        listData.add(NodeInput(id: person.name, next: nextStr));
      });
    }

    print('listData');
    print(listData);

    return listData;
  }
}
