import 'package:flutter/material.dart';
//import 'package:readwenderlich/data/repository.dart';
//import 'package:readwenderlich/entities/article.dart';
//import 'package:readwenderlich/ui/exception_indicators/empty_list_indicator.dart';
//import 'package:readwenderlich/ui/exception_indicators/error_indicator.dart';
//import 'package:readwenderlich/ui/list/article_list_item.dart';
//import 'package:readwenderlich/ui/preferences/list_preferences.dart';

// 1
class PagedArticleListView extends StatefulWidget {
  const PagedArticleListView({
    // 2
    @required this.repository,
    // 3
    this.listPreferences,
    Key key,
  })  : assert(repository != null),
        super(key: key);

  final Repository repository;
  final ListPreferences listPreferences;

  @override
  _PagedArticleListViewState createState() => _PagedArticleListViewState();
}

class _PagedArticleListViewState extends State<PagedArticleListView> {
  // 4
  ListPreferences get _listPreferences => widget.listPreferences;
 
  // TODO: Instantiate a PagingController.

  @override
  // 5
  Widget build(BuildContext context) => const Placeholder();
}
