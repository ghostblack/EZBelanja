import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class addnote extends StatelessWidget {

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          MaterialButton(
            onPressed: () {
              ref.add({
                'title' : title.text,
                'content' : content.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Home()));
              });
            },
            child: Text(
              "Save",
              style: 
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                  hintText: 'title',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child:Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: content,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'content',
                  ),
                ),
              ),
            ),
          ],
        ),
        
      ),
    );
  }
}

