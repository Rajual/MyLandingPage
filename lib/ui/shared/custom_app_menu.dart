import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_landing_page/providers/page_provider.dart';
import 'package:my_landing_page/ui/shared/custom_menu_item.dart';
import 'package:provider/provider.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController iconController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iconController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    final PageProvider pageProvider =
        Provider.of<PageProvider>(context, listen: false);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            iconController.reverse();
          } else {
            iconController.forward();
          }
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          width: 150,
          height: isOpen ? 300 : 40,
          color: Colors.greenAccent,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, iconController: iconController),
              if (isOpen) ...[
                CustomMenuItem(
                    text: 'Home', onPressed: () => pageProvider.goTo(0)),
                CustomMenuItem(
                    text: 'About', onPressed: () => pageProvider.goTo(1)),
                CustomMenuItem(
                    text: 'Contact', onPressed: () => pageProvider.goTo(2))
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.iconController,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController iconController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isOpen ? MainAxisAlignment.center : MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Menu',
              style: GoogleFonts.roboto(color: Colors.white, fontSize: 18)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: iconController,
          ),
        )
      ],
    );
  }
}
