class PostModel {
  List < Post > ? post;
  String ? date;
  String ? error;

  PostModel({
    this.post,
    this.date
  });

  PostModel.withError(String errorMessage) {
    error = errorMessage;
  }

  PostModel.fromJson(Map < String, dynamic > json) {
    if (json['Countries'] != null) {
      post = [];
      json['Countries'].forEach((v) {
        post!.add(Post.fromJson(v));
      });
    }
    date = json['Date'];
  }

  Map < String, dynamic > toJson() {
    final Map < String, dynamic > data = < String, dynamic > {};
    if (post != null) {
      data['Countries'] = post!.map((v) => v.toJson()).toList();
    }
    data['Date'] = date;
    return data;
  }
}

class Post {
  String ? name;
  String ? title;
  String ? date;

  Post({
    this.name,
    this.title,
    this.date
  });

  Post.fromJson(Map < String, dynamic > json) {
    name = json['Country'];
    title = json['CountryCode'];
    date = json['Date'];
  }

  Map < String, dynamic > toJson() {
    final Map < String, dynamic > data = < String, dynamic > {};
    data['Country'] = name;
    data['CountryCode'] = title;
    data['Date'] = date;
    return data;
  }
}
