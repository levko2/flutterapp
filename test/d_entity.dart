class DEntity {
  String publishedAt;
  String author;
  String urlToImage;
  String description;
  DSource source;
  String title;
  String url;
  String content;

  DEntity(
      {this.publishedAt,
      this.author,
      this.urlToImage,
      this.description,
      this.source,
      this.title,
      this.url,
      this.content});

  DEntity.fromJson(Map<String, dynamic> json) {
    publishedAt = json['publishedAt'];
    author = json['author'];
    urlToImage = json['urlToImage'];
    description = json['description'];
    source =
        json['source'] != null ? new DSource.fromJson(json['source']) : null;
    title = json['title'];
    url = json['url'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['publishedAt'] = this.publishedAt;
    data['author'] = this.author;
    data['urlToImage'] = this.urlToImage;
    data['description'] = this.description;
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    data['title'] = this.title;
    data['url'] = this.url;
    data['content'] = this.content;
    return data;
  }
}

class DSource {
  String name;
  dynamic id;

  DSource({this.name, this.id});

  DSource.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
