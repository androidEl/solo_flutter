import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solo_flutter/provider/provider_model.dart';
import 'package:solo_flutter/screens/screen2.dart';

// ignore: must_be_immutable
class Screen1 extends StatelessWidget {
  static String id = 'Screen1';

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Result'),
        elevation: 5,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            dataProvider.img == null
                ? Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Icon(Icons.image_not_supported),
                    ),
                  )
                : Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Image.memory(base64Decode(dataProvider.img)),
                    ),
                  ),
            Text('Nama : ${dataProvider.name}'),
            Text('Alamat : ${dataProvider.address}'),
            Text('Tanggal lahir : ${dataProvider.birthDay}'),
            Text('Tinggi badan : ${dataProvider.tinggi} cm'),
            Text('Berat badan : ${dataProvider.berat} kg'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushReplacementNamed(context, Screen2.id);
        },
      ),
    );
  }
}
