import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Models
import 'package:qrapp/models/scan_model.dart';

//Pages
import 'package:qrapp/pages/directions_page.dart';
import 'package:qrapp/pages/history_page.dart';
import 'package:qrapp/pages/maps_page.dart';

//Providers
import 'package:provider/provider.dart';
import 'package:qrapp/providers/db_provider.dart';
import 'package:qrapp/providers/scan_list_provider.dart';
import 'package:qrapp/providers/ui_provider.dart';

//Widgets
import 'package:qrapp/widgets/custom_navigationbar.dart';
import 'package:qrapp/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Obtener el selected
    final uiProvider = Provider.of<UiProvider>(context);
    // Widget para cambiar la página actual según el indice recibido
    final currentIndex = uiProvider.selectedMenuOpt;

    //Usar ScanLisProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    final a = scanListProvider.saveScans();
    print(a);

    switch (currentIndex) {
      case 0:
        return HistoryPage();
      case 1:
        scanListProvider.saveScanByType('geo');
        return MapsPage();
      case 2:
        scanListProvider.saveScanByType('http');
        return DirectionsPage();
      case 3:
        return HistoryPage();
      default:
        return DirectionsPage();
    }
  }
}
