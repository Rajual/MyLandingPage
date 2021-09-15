import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

//import 'dart:html' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  final List<String> _pages = ['home', 'about', 'contact'];

  goTo(int index) {
    final routeName = _pages[index];

    html.window.history.pushState(null, 'none', '#/$routeName');

    scrollController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
