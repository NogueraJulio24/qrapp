import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Models
import 'package:qrapp/models/scan_model.dart';

//Pages
import 'package:qrapp/pages/directions_page.dart';
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
      appBar: AppBar(
        // elevation: 0,
        title: Text('Record'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => new CupertinoAlertDialog(
                  title: Text('Record Delete'),
                  content: Text('Do you accept?'),
                  actions: [
                    CupertinoDialogAction(
                      child: Text("No"),
                      isDestructiveAction: false,
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pop("Discard");
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text("Yes"),
                      onPressed: () {
                        Provider.of<ScanListProvider>(context, listen: false)
                            .deleteAll();
                        Navigator.of(context, rootNavigator: true)
                            .pop("Discard");
                      },
                      isDestructiveAction: true,
                    ),
                  ],
                ),
              );
            },
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

    //Usar ScanLisProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    final a = scanListProvider.saveScans();
    print(a);

    switch (currentIndex) {
      case 0:
        scanListProvider.saveScanByType('http');
        return DirectionsPage();
      case 1:
        scanListProvider.saveScanByType('geo');
        return MapsPage();
      default:
        return DirectionsPage();
    }
  }
}
