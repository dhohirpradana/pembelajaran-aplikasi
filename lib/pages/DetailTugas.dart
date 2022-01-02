// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class DetailTugas extends StatefulWidget {
  final String? name;
  DetailTugas(this.name);

  @override
  _DetailTugasState createState() => _DetailTugasState();
}

class _DetailTugasState extends State<DetailTugas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
            child: Center(
              child: Text(
                "${widget.name} kajhkjasd kljhdaskasd asdjhasdjas dkjshdas dkasbd as dkas djas das",
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xFF6930c3),
                  fontSize: 22,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
            child: TextField(
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Link',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
              color: Colors.green,
              child: Text(
                "Kirim",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                // Navigator.of(context).pushNamed('/home');
              }),
        ],
      ),
    );
  }
}
