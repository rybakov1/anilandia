import 'package:anilandia/models/character_model.dart';

class AnimeFull {
  int? id;
  String? name;
  String? russian;
  String? image;
  String? url;
  String? kind;
  String? kindRussian;
  String? score;
  String? statusRussian;
  String? status;
  int? episodes;
  int? episodesAired;
  String? airedOn;
  String? releasedOn;
  String? releaseYear;
  String? rating;
  List<String>? english;
  List<String>? japanese;
  List<String>? synonyms;
  String? licenseNameRu;
  int? duration;
  String? description;
  String? franchise;
  bool? favoured;
  bool? anons;
  bool? ongoing;
  List<RatesScoresStats>? ratesScoresStats;
  List<RatesStatusesStats>? ratesStatusesStats;
  String? updatedAt;
  String? nextEpisodeAt;
  List<String>? fansubbers;
  List<String>? fandubbers;
  List<String>? licensors;
  List<Genres>? genres;
  List<Studios>? studios;
  List<Videos>? videos;
  List<Screenshots>? screenshots;
  List<Character>? mainCharacters;

  AnimeFull(
      {this.id,
        this.name,
        this.russian,
        this.image,
        this.url,
        this.kind,
        this.kindRussian,
        this.score,
        this.statusRussian,
        this.status,
        this.episodes,
        this.episodesAired,
        this.airedOn,
        this.releasedOn,
        this.releaseYear,
        this.rating,
        this.english,
        this.japanese,
        this.synonyms,
        this.licenseNameRu,
        this.duration,
        this.description,
        this.franchise,
        this.favoured,
        this.anons,
        this.ongoing,
        this.ratesScoresStats,
        this.ratesStatusesStats,
        this.updatedAt,
        this.nextEpisodeAt,
        this.fansubbers,
        this.fandubbers,
        this.licensors,
        this.genres,
        this.studios,
        this.videos,
        this.screenshots,
        this.mainCharacters
      });

  AnimeFull.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    russian = json['russian'];
    image = json['image'];
    url = json['url'];
    kind = json['kind'];
    kindRussian = json['kind_russian'];
    score = json['score'];
    statusRussian = json['status_russian'];
    status = json['status'];
    episodes = json['episodes'];
    episodesAired = json['episodes_aired'];
    airedOn = json['aired_on'];
    releasedOn = json['released_on'];
    releaseYear = json['release_year'];
    rating = json['rating'];
    english = json['english'].cast<String>();
    japanese = json['japanese'].cast<String>();
    synonyms = json['synonyms'].cast<String>();
    licenseNameRu = json['license_name_ru'];
    duration = json['duration'];
    description = json['description'];
    franchise = json['franchise'];
    favoured = json['favoured'];
    anons = json['anons'];
    ongoing = json['ongoing'];
    if (json['rates_scores_stats'] != null) {
      ratesScoresStats = <RatesScoresStats>[];
      json['rates_scores_stats'].forEach((v) {
        ratesScoresStats!.add(new RatesScoresStats.fromJson(v));
      });
    }
    if (json['rates_statuses_stats'] != null) {
      ratesStatusesStats = <RatesStatusesStats>[];
      json['rates_statuses_stats'].forEach((v) {
        ratesStatusesStats!.add(new RatesStatusesStats.fromJson(v));
      });
    }
    updatedAt = json['updated_at'];
    nextEpisodeAt = json['next_episode_at'];
    fansubbers = json['fansubbers'].cast<String>();
    fandubbers = json['fandubbers'].cast<String>();
    licensors = json['licensors'].cast<String>();
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(new Genres.fromJson(v));
      });
    }
    if (json['studios'] != null) {
      studios = <Studios>[];
      json['studios'].forEach((v) {
        studios!.add(new Studios.fromJson(v));
      });
    }
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(new Videos.fromJson(v));
      });
    }
    if (json['screenshots'] != null) {
      screenshots = <Screenshots>[];
      json['screenshots'].forEach((v) {
        screenshots!.add(new Screenshots.fromJson(v));
      });
    }
    if (json['main_characters'] != null) {
      mainCharacters = <Character>[];
      json['main_characters'].forEach((v) { mainCharacters!.add(new Character.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['russian'] = this.russian;
    data['image'] = this.image;
    data['url'] = this.url;
    data['kind'] = this.kind;
    data['kind_russian'] = this.kindRussian;
    data['score'] = this.score;
    data['status_russian'] = this.statusRussian;
    data['status'] = this.status;
    data['episodes'] = this.episodes;
    data['episodes_aired'] = this.episodesAired;
    data['aired_on'] = this.airedOn;
    data['released_on'] = this.releasedOn;
    data['release_year'] = this.releaseYear;
    data['rating'] = this.rating;
    data['english'] = this.english;
    data['japanese'] = this.japanese;
    data['synonyms'] = this.synonyms;
    data['license_name_ru'] = this.licenseNameRu;
    data['duration'] = this.duration;
    data['description'] = this.description;
    data['franchise'] = this.franchise;
    data['favoured'] = this.favoured;
    data['anons'] = this.anons;
    data['ongoing'] = this.ongoing;
    if (this.ratesScoresStats != null) {
      data['rates_scores_stats'] =
          this.ratesScoresStats!.map((v) => v.toJson()).toList();
    }
    if (this.ratesStatusesStats != null) {
      data['rates_statuses_stats'] =
          this.ratesStatusesStats!.map((v) => v.toJson()).toList();
    }
    data['updated_at'] = this.updatedAt;
    data['next_episode_at'] = this.nextEpisodeAt;
    data['fansubbers'] = this.fansubbers;
    data['fandubbers'] = this.fandubbers;
    data['licensors'] = this.licensors;
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    if (this.studios != null) {
      data['studios'] = this.studios!.map((v) => v.toJson()).toList();
    }
    if (this.videos != null) {
      data['videos'] = this.videos!.map((v) => v.toJson()).toList();
    }
    if (this.screenshots != null) {
      data['screenshots'] = this.screenshots!.map((v) => v.toJson()).toList();
    }
    if (this.mainCharacters != null) {
      data['main_characters'] = this.mainCharacters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RatesScoresStats {
  int? name;
  int? value;

  RatesScoresStats({this.name, this.value});

  RatesScoresStats.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class RatesStatusesStats {
  String? name;
  int? value;

  RatesStatusesStats({this.name, this.value});

  RatesStatusesStats.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class Genres {
  int? id;
  String? name;
  String? russian;
  String? kind;
  String? entryType;

  Genres({this.id, this.name, this.russian, this.kind, this.entryType});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    russian = json['russian'];
    kind = json['kind'];
    entryType = json['entry_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['russian'] = this.russian;
    data['kind'] = this.kind;
    data['entry_type'] = this.entryType;
    return data;
  }
}

class Studios {
  int? id;
  String? name;
  String? filteredName;
  bool? real;
  String? image;

  Studios({this.id, this.name, this.filteredName, this.real, this.image});

  Studios.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    filteredName = json['filtered_name'];
    real = json['real'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['filtered_name'] = this.filteredName;
    data['real'] = this.real;
    data['image'] = this.image;
    return data;
  }
}

class Videos {
  int? id;
  String? url;
  String? imageUrl;
  String? playerUrl;
  String? name;
  String? kind;
  String? hosting;

  Videos(
      {this.id,
        this.url,
        this.imageUrl,
        this.playerUrl,
        this.name,
        this.kind,
        this.hosting});

  Videos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    imageUrl = json['image_url'];
    playerUrl = json['player_url'];
    name = json['name'];
    kind = json['kind'];
    hosting = json['hosting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    data['player_url'] = this.playerUrl;
    data['name'] = this.name;
    data['kind'] = this.kind;
    data['hosting'] = this.hosting;
    return data;
  }
}

class Screenshots {
  String? original;
  String? preview;

  Screenshots({this.original, this.preview});

  Screenshots.fromJson(Map<String, dynamic> json) {
    original = json['original'];
    preview = json['preview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original'] = this.original;
    data['preview'] = this.preview;
    return data;
  }
}
