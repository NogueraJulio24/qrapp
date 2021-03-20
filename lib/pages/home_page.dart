import 'package:flutter/material.dart';

//Models
import 'package:qrapp/models/scan_model.dart';

//Pages
import 'package:qrapp/pages/directions_page.dart';
import 'package:qrapp/pages/maps_page.dart';

//Providers
import 'package:provider/provider.dart';
import 'package:qrapp/providers/db_provider.dart';
import 'package:qrapp/providers/ui_provider.dart';

//Widgets
import 'package:qrapp/widgets/custom_navigationbar.dart';
import 'package:qrapp/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {},
          ),
        ],
      ),
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

    // TODO: leer db
    // final newScan = new ScanModel(value: 'http://google.com');
    // DBProvider.db.newScan(newScan);

    switch (currentIndex) {
      case 0:
        return MapsPage();
      case 1:
        return DirectionsPage();
      default:
        return MapsPage();
    }
  }
}
