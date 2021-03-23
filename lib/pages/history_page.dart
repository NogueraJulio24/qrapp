import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrapp/providers/scan_list_provider.dart';
import 'package:qrapp/widgets/scan_tiles.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // elevation: 0,
          title: Text('QR History'),
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
            IconButton(onPressed: () {}, icon: Icon(Icons.filter)),
          ],
        ),
        body: ScanTiles(type: 'http'));
  }
}
