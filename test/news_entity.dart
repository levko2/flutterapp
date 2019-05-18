class NewsEntity {
  int totalResults;
  List<NewsArticle> articles;
  String status;

  NewsEntity({this.totalResults, this.articles, this.status});

  NewsEntity.fromJson(Map<String, dynamic> json) {
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = new List<NewsArticle>();
      (json['articles'] as List).forEach((v) {
        articles.add(new NewsArticle.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalResults'] = this.totalResults;
    if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class NewsArticle {
  String publishedAt;
  String author;
  String urlToImage;
  String description;
  NewsArticlesSource source;
  String title;
  String url;
  String content;

  NewsArticle(
      {this.publishedAt,
      this.author,
      this.urlToImage,
      this.description,
      this.source,
      this.title,
      this.url,
      this.content});

  NewsArticle.fromJson(Map<String, dynamic> json) {
    publishedAt = json['publishedAt'];
    author = json['author'];
    urlToImage = json['urlToImage'];
    description = json['description'];
    source = json['source'] != null
        ? new NewsArticlesSource.fromJson(json['source'])
        : null;
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

class NewsArticlesSource {
  String name;
  dynamic id;

  NewsArticlesSource({this.name, this.id});

  NewsArticlesSource.fromJson(Map<String, dynamic> json) {
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
