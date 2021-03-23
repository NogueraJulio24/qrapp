import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrapp/providers/scan_list_provider.dart';
import 'package:qrapp/widgets/scan_tiles.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          title: Text(
            'QR History',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.qr_code),
              color: Colors.black,
            ),
            IconButton(
              color: Colors.black,
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
        body: ScanTiles(type: 'http'));
  }
}
