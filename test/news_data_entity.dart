class ArticleEntityEntity {
  int totalResults;
  List<ArticleEntityArticle> articles;
  String status;

  ArticleEntityEntity({this.totalResults, this.articles, this.status});

  ArticleEntityEntity.fromJson(Map<String, dynamic> json) {
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = new List<ArticleEntityArticle>();
      (json['articles'] as List).forEach((v) {
        articles.add(new ArticleEntityArticle.fromJson(v));
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

class ArticleEntityArticle {
  String publishedAt;
  String author;
  String urlToImage;
  String description;
  ArticleEntityArticlesSource source;
  String title;
  String url;
  String content;

  ArticleEntityArticle(
      {this.publishedAt,
      this.author,
      this.urlToImage,
      this.description,
      this.source,
      this.title,
      this.url,
      this.content});

  ArticleEntityArticle.fromJson(Map<String, dynamic> json) {
    publishedAt = json['publishedAt'];
    author = json['author'];
    urlToImage = json['urlToImage'];
    description = json['description'];
    source = json['source'] != null
        ? new ArticleEntityArticlesSource.fromJson(json['source'])
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

class ArticleEntityArticlesSource {
  String name;
  dynamic id;

  ArticleEntityArticlesSource({this.name, this.id});

  ArticleEntityArticlesSource.fromJson(Map<String, dynamic> json) {
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
