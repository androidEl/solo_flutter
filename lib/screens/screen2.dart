import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:solo_flutter/provider/provider_model.dart';
import 'package:solo_flutter/screens/screen1.dart';

class Screen2 extends StatefulWidget {
  static String id = 'Screen2';
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final _formKey = GlobalKey<FormState>();

  File _image;
  String imgStr;

  bool _isEnable = true;

  DateTime selectedDate;
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();
  TextEditingController beratController = TextEditingController();

  Future getImageFromCamera() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        print(pickedFile.path);
        _image = File(pickedFile.path);
        imgStr = base64Encode(_image.readAsBytesSync());
      });
      Navigator.of(context).pop(false);
    } else {
      Navigator.of(context).pop(false);
    }
  }

  Future getImageFromGalery() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        imgStr = base64Encode(_image.readAsBytesSync());
      });
      Navigator.of(context).pop(false);
    } else {
      Navigator.of(context).pop(false);
    }
  }

  Future<bool> _openChooseImage() {
    return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              title: new Text("Pilih Gambar"),
              content: Container(
                height: 100,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            getImageFromGalery();
                          },
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.image),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Pilih dari koleksi gambar'),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            getImageFromCamera();
                          },
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.camera_alt),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Ambil dari kamera'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  @override
  void initState() {
    Timer(Duration(seconds: 60), () {
      setState(() {
        _isEnable = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pData = Provider.of<DataProvider>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  imgStr != null
                      ? Container(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Image.memory(base64Decode(imgStr)),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Icon(Icons.image_not_supported),
                        ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.blueAccent)),
                      color: Colors.white,
                      textColor: Colors.blueAccent,
                      onPressed: _openChooseImage,
                      child: Text(
                        "Pilih gambar",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: namaController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Nama Lengkap',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: alamatController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Alamat',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DateField(
                    decoration: InputDecoration(
                      labelText: 'Tanggal lahir',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    selectedDate: selectedDate,
                    onDateSelected: (DateTime value) {
                      setState(() {
                        selectedDate = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: tinggiController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Tinggi (cm)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: beratController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Berat (kg)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.blueAccent)),
                      color: Colors.white,
                      textColor: Colors.blueAccent,
                      onPressed: _isEnable == true
                          ? () {
                              pData.name = namaController.text;
                              pData.address = alamatController.text;
                              pData.img = imgStr;
                              pData.birthDay =
                                  '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}';
                              pData.tinggi = tinggiController.text;
                              pData.berat = beratController.text;
                              Navigator.pushReplacementNamed(
                                  context, Screen1.id);
                            }
                          : null,
                      child: Text(
                        "Simpan Data",
                        style:
                            TextStyle(fontSize: 24, color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
