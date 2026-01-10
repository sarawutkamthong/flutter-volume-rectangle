import 'package:flutter/material.dart';

class RectanglePage extends StatefulWidget {
  const RectanglePage({super.key});

  @override
  State<RectanglePage> createState() => RectanglePageState();
}

class RectanglePageState extends State<RectanglePage> {
  // ปริมาตรทรงสี่เหลี่ยม = กว้าง * ยาว * สูง

  int _width = 0;
  int _length = 0;
  int _height = 0;
  int _volume = 0;

  TextEditingController _widthCtrl = TextEditingController();
  TextEditingController _lengthCtrl = TextEditingController();
  TextEditingController _heightCtrl = TextEditingController();

  final InputDecoration _textFieldStyle = InputDecoration(
    filled: true,
    fillColor: Colors.blue[100],
    border: OutlineInputBorder(),
  );

  void _calRectangle() {
    _width = int.tryParse(_widthCtrl.text) ?? 0;
    _length = int.tryParse(_lengthCtrl.text) ?? 0;
    _height = int.tryParse(_heightCtrl.text) ?? 0;

    setState(() {
      _volume = _width * _length * _height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("คำนวณปริมาตรทรงสี่เหลี่ยม"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Text(
            "กว้าง $_width × ยาว $_length × สูง $_height = ปริมาตร $_volume ลบ.หน่วย",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),

          TextField(
            controller: _widthCtrl,
            decoration: _textFieldStyle.copyWith(
              label: Text("ความกว้าง"),
              hint: Text("กรอกความกว้าง"),
            ),
          ),
          SizedBox(height: 20),

          TextField(
            controller: _lengthCtrl,
            decoration: _textFieldStyle.copyWith(
              label: Text("ความยาว"),
              hint: Text("กรอกความยาว"),
            ),
          ),
          SizedBox(height: 20),

          TextField(
            controller: _heightCtrl,
            decoration: _textFieldStyle.copyWith(
              label: Text("ความสูง"),
              hint: Text("กรอกความสูง"),
            ),
          ),
          SizedBox(height: 30),

          ElevatedButton(
            onPressed: () => _calRectangle(),
            child: Text("คำนวณ"),
          ),
        ],
      ),
    );
  }
}
