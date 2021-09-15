import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

//import 'dart:html' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  final List<String> _pages = ['home', 'about', 'contact'];

  int _currentIndex = 0;
  createScrollController(String routeName) {
    scrollController = PageController(initialPage: getPageIndex(routeName));
    html.document.title = _pages[getPageIndex(routeName)];
    scrollController.addListener(() {
      final int index = (scrollController.page ?? 0).round();
      if (index != _currentIndex) {
        html.window.history.pushState(null, 'none', '#/${_pages[index]}');
        _currentIndex = index;
        html.document.title = _pages[index];
      }
    });
  }

  int getPageIndex(String routrName) {
    return (!_pages.contains(routrName)) ? 0 : _pages.indexOf(routrName);
  }

  goTo(int index) {
    html.window.history.pushState(null, 'none', '#/${_pages[index]}');

    scrollController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
