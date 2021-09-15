import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

//import 'dart:html' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  final List<String> _pages = ['home', 'about', 'contact'];
//TODO: Fixe it.
  createScrollController(String routerName){
    this.scrollController=new PageController(initialPage: )
  }

  int getPageIndex(String routrName){
    return (!_pages.contains(routrName))?0:_pages.indexOf(routrName);
  }

  goTo(int index) {
    final routeName = _pages[index];

    html.window.history.pushState(null, 'none', '#/$routeName');

    scrollController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
