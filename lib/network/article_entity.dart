class ArticleEntity {
  String publishedAt;
  String author;
  String urlToImage;
  String description;
  String title;
  String url;
  String content;

  ArticleEntity(
      {this.publishedAt,
      this.author,
      this.urlToImage,
      this.description,
      this.title,
      this.url,
      this.content});

  ArticleEntity.fromJson(Map<String, dynamic> json) {
    publishedAt = json['publishedAt'];
    author = json['author'];
    urlToImage = json['urlToImage'];
    description = json['description'];
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
    data['title'] = this.title;
    data['url'] = this.url;
    data['content'] = this.content;
    return data;
  }
}
