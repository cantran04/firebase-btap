import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'json.dart';

class FirebaseServices {
  static Future<DocumentSnapshot> adminSignIn(id) async {
    var res =
        await FirebaseFirestore.instance.collection("admin").doc(id).get();
    return res;
  }
}



class sinhVien extends StatefulWidget{
  @override
  // ignore: library_private_types_in_public_api
  _sinhVienState createState() => _sinhVienState();
}



class _sinhVienState extends State<sinhVien> {
  final _id = TextEditingController();
  final _maSinhVien = TextEditingController();

  final _ngaySinh = TextEditingController();

  final _gioiTinh = TextEditingController();

  final _queQuan = TextEditingController();
  var _output = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 186, 248, 244),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text('ID:'),
                  ),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _id,
                      )),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text('Mã sinh viên:'),
                  ),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _maSinhVien,
                      )),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text('Ngày sinh:'),
                  ),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _ngaySinh,
                      )),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text('Giới tính:'),
                  ),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _gioiTinh,
                      )),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text('Quê quán:'),
                  ),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _queQuan,
                      )),
                ],
              ),
            ),
            Container(
            
              child: ElevatedButton(
                onPressed: () async {
                  CollectionReference collection =
                      FirebaseFirestore.instance.collection('SinhVien');
                  await collection.add({
                  "maSinhVien": _maSinhVien.text,
                        "ngaySinh": _ngaySinh.text,
                        "gioiTinh": _gioiTinh.text,
                        "queQuan": _queQuan.text
                  });
                },
                child: Text('Tạo'),
              ),
              
            ),
            Container(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () async {
                      CollectionReference collection =
                          FirebaseFirestore.instance.collection('SinhVien');
                          
                      await collection.doc(_id.text).update({
                        "maSinhVien": _maSinhVien.text,
                        "ngaySinh": _ngaySinh.text,
                        "gioiTinh": _gioiTinh.text,
                        "queQuan": _queQuan.text
                      });
                      
                    },
                    child: Text('Sửa'),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () async {
                      CollectionReference collection =
                          FirebaseFirestore.instance.collection('SinhVien');
                      collection.doc(_id.text).delete();
                    },
                    child: Text('Xóa'),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      CollectionReference collection =
                          FirebaseFirestore.instance.collection('SinhVien');
                      QuerySnapshot querySnapshot = await collection.get();
                      List<DocumentSnapshot> documents = querySnapshot.docs;
                      setState(() {
                        for (var doc in documents) {
                          _output = _output + doc.data().toString();
                        }
                      });
                    },
                    child: Text('In ra'),
                  ),
                  Text(_output),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
