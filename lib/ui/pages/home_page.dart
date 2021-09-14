import 'package:flutter/material.dart';
import 'package:my_landing_page/ui/views/about_view.dart';
import 'package:my_landing_page/ui/views/contact_view.dart';
import 'package:my_landing_page/ui/views/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _HomeBody(),
          Positioned(
              right: 20,
              top: 20,
              child: Container(
                width: 150,
                height: 50,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [HomeView(), AboutView(), ContactView()],
    );
  }
}
