class Person {
  String id;
  String name;
  String parent;
  String gender;

  Person({this.id, this.name, this.parent, this.gender});

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parent = json['parent'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['parent'] = this.parent;
    data['gender'] = this.gender;
    return data;
  }
}