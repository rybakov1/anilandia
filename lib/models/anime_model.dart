class AnimeSearchModel {
  int? id;
  String? name;
  String? russian;
  String? image;
  String? kind;
  String? kindRussian;
  String? score;
  String? status;
  String? statusRussian;
  int? episodes;
  String? releaseYear;

  AnimeSearchModel(
      {this.id,
      this.name,
      this.russian,
      this.image,
      this.kind,
      this.kindRussian,
      this.score,
      this.status,
      this.statusRussian,
      this.episodes,
      this.releaseYear});

  AnimeSearchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    russian = json['russian'];
    image = json['image'];
    kind = json['kind'];
    kindRussian = json['kind_russian'];
    score = json['score'];
    status = json['status'];
    statusRussian = json['status_russian'];
    episodes = json['episodes'];
    releaseYear = json['release_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['russian'] = russian;
    data['image'] = image;
    data['kind'] = kind;
    data['kind_russian'] = kindRussian;
    data['score'] = score;
    data['status'] = status;
    data['status_russian'] = statusRussian;
    data['episodes'] = episodes;
    data['release_year'] = releaseYear;
    return data;
  }
}
