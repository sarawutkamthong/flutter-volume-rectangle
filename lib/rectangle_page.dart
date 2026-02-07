import 'package:flutter/material.dart';

Widget neonBackground({required Widget child}) {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.black, Color(0xff1a0033)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: child,
  );
}

Widget neonResult(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.purpleAccent,
      shadows: [
        Shadow(color: Colors.purpleAccent, blurRadius: 20),
      ],
    ),
  );
}

Widget neonInput(String label, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.purpleAccent),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purpleAccent),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}

Widget neonButton(VoidCallback onPressed) {
  return Container(
    width: double.infinity,
    height: 50,
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(color: Colors.purple, blurRadius: 20),
      ],
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        side: const BorderSide(color: Colors.purpleAccent, width: 2),
      ),
      onPressed: onPressed,
      child: const Text(
        "คำนวณ",
        style: TextStyle(
          fontSize: 18,
          color: Colors.purpleAccent,
        ),
      ),
    ),
  );
}

/// ---------------- AREA ----------------
class AreaPage extends StatefulWidget {
  const AreaPage({super.key});

  @override
  State<AreaPage> createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  int area = 0;
  final widthCtrl = TextEditingController();
  final lengthCtrl = TextEditingController();

  void calculate() {
    setState(() {
      int w = int.tryParse(widthCtrl.text) ?? 0;
      int l = int.tryParse(lengthCtrl.text) ?? 0;
      area = w * l;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("คำนวณพื้นที่"),
        backgroundColor: Colors.black,
      ),
      body: neonBackground(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              neonResult("พื้นที่ = $area"),
              const SizedBox(height: 20),
              neonInput("ความกว้าง", widthCtrl),
              neonInput("ความยาว", lengthCtrl),
              const SizedBox(height: 20),
              neonButton(calculate),
            ],
          ),
        ),
      ),
    );
  }
}

/// ---------------- VOLUME ----------------
class VolumePage extends StatefulWidget {
  const VolumePage({super.key});

  @override
  State<VolumePage> createState() => _VolumePageState();
}

class _VolumePageState extends State<VolumePage> {
  int volume = 0;
  final widthCtrl = TextEditingController();
  final lengthCtrl = TextEditingController();
  final heightCtrl = TextEditingController();

  void calculate() {
    setState(() {
      int w = int.tryParse(widthCtrl.text) ?? 0;
      int l = int.tryParse(lengthCtrl.text) ?? 0;
      int h = int.tryParse(heightCtrl.text) ?? 0;
      volume = w * l * h;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("คำนวณปริมาตร"),
        backgroundColor: Colors.black,
      ),
      body: neonBackground(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              neonResult("ปริมาตร = $volume"),
              const SizedBox(height: 20),
              neonInput("ความกว้าง", widthCtrl),
              neonInput("ความยาว", lengthCtrl),
              neonInput("ความสูง", heightCtrl),
              const SizedBox(height: 20),
              neonButton(calculate),
            ],
          ),
        ),
      ),
    );
  }
}
