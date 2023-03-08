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



class lopHoc extends StatefulWidget{
  @override
  // ignore: library_private_types_in_public_api
  _lopHocState createState() => _lopHocState();
}



class _lopHocState extends State<lopHoc> {
  final _id = TextEditingController();

  final _maLopHoc = TextEditingController();
  final _tenLop = TextEditingController();

  final _soLuongSinhVien = TextEditingController();

  final _maGiangVien = TextEditingController();
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
                    child: Text('Mã lớp học:'),
                  ),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _maLopHoc,
                      )),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text('Tên lớp:'),
                  ),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _tenLop,
                      )),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text('Số lượng sinh viên:'),
                  ),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _soLuongSinhVien,
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
            
              child: ElevatedButton(
                onPressed: () async {
                  CollectionReference collection =
                      FirebaseFirestore.instance.collection('LopHoc');
                  await collection.add({
                    "maLopHoc": _maGiangVien.text,
                    "tenLop": _tenLop.text,
                    "soLuongSinhVien": _soLuongSinhVien.text,
                    "maGiangVien": _maGiangVien.text
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
                          FirebaseFirestore.instance.collection('LopHoc');
                          
                      await collection.doc(_id.text).update({
                       "maLopHoc": _maGiangVien.text,
                    "tenLop": _tenLop.text,
                    "soLuongSinhVien": _soLuongSinhVien.text,
                    "maGiangVien": _maGiangVien.text
                      });
                      
                    },
                    child: Text('Sửa'),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () async {
                      CollectionReference collection =
                          FirebaseFirestore.instance.collection('LopHoc');
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
                          FirebaseFirestore.instance.collection('LopHoc');
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
