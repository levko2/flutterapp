import 'package:flutterapp/network/article_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "AsdEntity") {
      return ArticleEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}
