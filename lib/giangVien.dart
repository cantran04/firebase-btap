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



class giangVien extends StatefulWidget{
  @override
  // ignore: library_private_types_in_public_api
  _giangVienState createState() => _giangVienState();
}



class _giangVienState extends State<giangVien> {
  final _id = TextEditingController();
  final _maGiangVien = TextEditingController();

  final _hoTen = TextEditingController();

  final _diaChi = TextEditingController();

  final _soDienThoai = TextEditingController();
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
                    child: Text('Mã giảng viên:'),
                  ),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _maGiangVien,
                      )),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text('Họ tên:'),
                  ),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _hoTen,
                      )),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text('Địa chỉ:'),
                  ),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _diaChi,
                      )),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text('Số điện thoại:'),
                  ),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _soDienThoai,
                      )),
                ],
              ),
            ),
            Container(
            
              child: ElevatedButton(
                onPressed: () async {
                  CollectionReference collection =
                      FirebaseFirestore.instance.collection('GiangVien');
                  await collection.add({
                    "maGiangVien": _maGiangVien.text,
                      "hoTen": _hoTen.text,
                      "diaChi": _diaChi.text,
                      "soDienThoai": _soDienThoai.text
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
                          FirebaseFirestore.instance.collection('GiangVien');
                          
                      await collection.doc(_id.text).update({
                        "maGiangVien": _maGiangVien.text,
                        "hoTen": _hoTen.text,
                        "diaChi": _diaChi.text,
                        "soDienThoai": _soDienThoai.text
                      });
                      
                    },
                    child: Text('Sửa'),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () async {
                      CollectionReference collection =
                          FirebaseFirestore.instance.collection('GiangVien');
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
                          FirebaseFirestore.instance.collection('GiangVien');
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
