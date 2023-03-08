import 'package:flutter/material.dart';
import 'package:tt/giangVien.dart';
import 'package:tt/sinhVien.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tt/lopHoc.dart';
import 'monHoc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform,);
  runApp( MyApp());
}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HHH(),
    );
  }
}

class HHH extends StatefulWidget {
  @override
  State<HHH> createState() => _HHHState();
}








class _HHHState extends State<HHH> {
  // const ADD({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
        
          children:[
            Text("Dùng Flutter và Firebase Database để tạo CRUD cho các thực thể ",
            style: TextStyle(
                  color: Color.fromARGB(255, 243, 33, 33),
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 90),
              TextButton(
                  style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.red,
                  ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => sinhVien()),
                  );
                },
                child: Text('Sinh Viên'),
              ),
              SizedBox(height: 40),
              TextButton(
                  style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromARGB(255, 0, 208, 255),
                  ),
               onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => giangVien()),
                  );
                },
                child: Text('Giảng Viên'),
              ),
              SizedBox(height: 40),
              TextButton(
                  style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromARGB(255, 47, 255, 0),
                  ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => lopHoc()),
                  );
                },
                child: Text('Lớp Học'),
              ),
              SizedBox(height: 40),
              TextButton(
                  style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromARGB(255, 255, 179, 0),
                  ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => monHoc()),
                  );
                },
                child: Text('Môn Học'),
              ),

          ]
          
        ),
            
    ),
      
    );
  }
}
