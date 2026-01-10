import 'package:flutter/material.dart';

class RectanglePage extends StatefulWidget {
  const RectanglePage({super.key});

  @override
  State<RectanglePage> createState() => RectanglePageState();
}

class RectanglePageState extends State<RectanglePage> {
  // ปริมาตรทรงสี่เหลี่ยม = กว้าง × ยาว × สูง

  int _width = 0;
  int _length = 0;
  int _height = 0;
  int _volume = 0;

  final TextEditingController _widthCtrl = TextEditingController();
  final TextEditingController _lengthCtrl = TextEditingController();
  final TextEditingController _heightCtrl = TextEditingController();

  final InputDecoration _textFieldStyle = InputDecoration(
    filled: true,
    fillColor: Colors.blue[100],
    border: const OutlineInputBorder(),
  );

  void _calRectangle() {
    setState(() {
      _width = int.tryParse(_widthCtrl.text) ?? 0;
      _length = int.tryParse(_lengthCtrl.text) ?? 0;
      _height = int.tryParse(_heightCtrl.text) ?? 0;
      _volume = _width * _length * _height;
    });
  }

  @override
  void dispose() {
    _widthCtrl.dispose();
    _lengthCtrl.dispose();
    _heightCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("คำนวณปริมาตรทรงสี่เหลี่ยม"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "กว้าง $_width × ยาว $_length × สูง $_height\n= ปริมาตร $_volume ลูกบาศก์หน่วย",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),

            TextField(
              controller: _widthCtrl,
              keyboardType: TextInputType.number,
              decoration: _textFieldStyle.copyWith(
                labelText: "ความกว้าง",
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _lengthCtrl,
              keyboardType: TextInputType.number,
              decoration: _textFieldStyle.copyWith(
                labelText: "ความยาว",
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _heightCtrl,
              keyboardType: TextInputType.number,
              decoration: _textFieldStyle.copyWith(
                labelText: "ความสูง",
              ),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: _calRectangle,
              child: const Text("คำนวณ"),
            ),
          ],
        ),
      ),
    );
  }
}
