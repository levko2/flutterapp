import 'package:flutter/material.dart';
import 'package:flutterapp/network/api.dart';
import 'package:flutterapp/network/article_entity.dart';
import 'package:flutterapp/ui/item.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsState();
  }
}

class _NewsState extends State<NewsScreen> {
  List<ArticleEntity> _news = List<ArticleEntity>();
  var _isLoading = true;

  Future _retrieveNews(String value) async {
    _isLoading = true;
    final api = Api();
    final jsonTeams = await api.search(value);

    if (jsonTeams == null) {
      return;
    }

    List<ArticleEntity> teams =
        jsonTeams.map((team) => ArticleEntity.fromJson(team)).toList();

    setState(() {
      _isLoading = false;
      _news.clear();
      _news.addAll(teams);
    });
  }

  Widget _buildTeamList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TeamTile(
          team: _news[index],
        );
      },
      itemCount: _news.length,
    );
  }

  Widget _checkIfLoading() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return _buildTeamList();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_news.isEmpty) _retrieveNews("news");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            _buildSearch(),
            Expanded(
              child: _checkIfLoading(),
            ),
          ],
        ),
      ),
    );
  }

  _buildSearch() {
    TextEditingController editingController = TextEditingController();
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: (value) {
            _retrieveNews(value);
          },
          controller: editingController,
          decoration: InputDecoration(
              labelText: "Search",
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)))),
        ));
  }
}
