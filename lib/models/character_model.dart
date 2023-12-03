class Character {
  int? id;
  String? name;
  String? russian;
  String? image;

  Character({this.id, this.name, this.russian, this.image});

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    russian = json['russian'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['russian'] = russian;
    data['image'] = image;
    return data;
  }
}