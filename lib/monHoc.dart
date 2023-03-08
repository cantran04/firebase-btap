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



class monHoc extends StatefulWidget{
  @override
  // ignore: library_private_types_in_public_api
  _monHocState createState() => _monHocState();
}



class _monHocState extends State<monHoc> {
  final _id = TextEditingController();
  final _maMonHoc = TextEditingController();

  final _tenMonHoc = TextEditingController();

  final _moTa = TextEditingController();

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
                    child: Text('Mã môn học:'),
                  ),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _maMonHoc,
                      )),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text('Tên môn học:'),
                  ),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _tenMonHoc,
                      )),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text('Mô tả:'),
                  ),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _moTa,
                      )),
                ],
              ),
            ),
           
            Container(
            
              child: ElevatedButton(
                onPressed: () async {
                  CollectionReference collection =
                      FirebaseFirestore.instance.collection('MonHoc');
                  await collection.add({
                    "maMonHoc": _maMonHoc.text,
                    "TenMonHoc": _tenMonHoc.text,
                    "moTa": _moTa.text,
                    
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
                          FirebaseFirestore.instance.collection('MonHoc');
                          
                      await collection.doc(_id.text).update({
                        "maMonHoc": _maMonHoc.text,
                        "TenMonHoc": _tenMonHoc.text,
                        "moTa": _moTa.text,
                      });
                      
                    },
                    child: Text('Sửa'),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () async {
                      CollectionReference collection =
                          FirebaseFirestore.instance.collection('MonHoc');
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
                          FirebaseFirestore.instance.collection('MonHoc');
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
