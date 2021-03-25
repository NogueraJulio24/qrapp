import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrapp/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    return CurvedNavigationBar(
      backgroundColor: Colors.blueAccent,
      items: <Widget>[
        Icon(Icons.history, size: 30),
        Icon(Icons.qr_code, size: 30),
        Icon(Icons.star, size: 30),
        Icon(Icons.settings, size: 30),
      ],
      color: Colors.white,
      buttonBackgroundColor: Colors.white,
      animationCurve: Curves.easeInOutQuad,
      onTap: (index) {
        //Handle button tap
        uiProvider.selectedMenuOpt = index;
      },
    );
  }
}
