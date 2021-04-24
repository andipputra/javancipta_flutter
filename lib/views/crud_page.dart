import 'package:flutter/material.dart';
import 'package:javancipta_flutter/models/person.dart';
import 'package:javancipta_flutter/repository/repository.dart';

class CrudPage extends StatelessWidget {

  final _repo = Repository();

  _checkColor(String gender){
    var bool = false;

    if(gender == 'Male') bool = true;

    return bool;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: _repo.getAllPerson(),
          builder: (context, snapshot){

            if(snapshot.hasData){

              var data = snapshot.data as List<Person>;

              return ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return Container(
                    color: _checkColor(data[i].gender) ? Colors.blue : Colors.pink,
                    child: ListTile(
                      title: Text(data[i].name),
                    ),
                  );
                }
                );
            }

            return CircularProgressIndicator();
          }
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
