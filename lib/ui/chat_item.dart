import 'package:flutter/material.dart';
import 'package:flutterapp/network/article_entity.dart';
import 'package:meta/meta.dart';

const _rowHeight = 72.0;
final _borderRadius = BorderRadius.circular(5.0);

class TeamTile extends StatelessWidget {
  final ArticleEntity team;
  final ValueChanged<ArticleEntity> onTap;

  const TeamTile({Key key, @required this.team, this.onTap})
      : assert(team != null);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: _rowHeight,
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: _setupImage(team.urlToImage),
                ),
                Center(
                  child: Text(
                    team.title,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _setupImage(String url) {
    if (url == null)
      return DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/ic_launcher.png'),
            // ...
          ),
          // ...
        ),
      );
    return Image.network(
      team.urlToImage,
      fit: BoxFit.contain,
      height: 48.0,
      width: 48.0,
    );
  }
}
