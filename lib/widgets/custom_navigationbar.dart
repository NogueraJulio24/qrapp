import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrapp/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      elevation: 15,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code),
          label: "No",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code),
          label: "Create",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Create',
        ),
      ],
    );
  }
}
