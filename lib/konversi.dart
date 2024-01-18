import 'package:flutter/material.dart';

class KonversiSuhuPage extends StatefulWidget {
  const KonversiSuhuPage({Key? key}) : super(key: key);

  @override
  _KonversiSuhuPageState createState() => _KonversiSuhuPageState();
}

class _KonversiSuhuPageState extends State<KonversiSuhuPage> {
  TextEditingController _inputController = TextEditingController();
  double _resultKelvin = 0.0;
  double _resultReamur = 0.0;

  void _calculateConversion() {
    if (_inputController.text.isNotEmpty) {
      double celcius = double.parse(_inputController.text);
      // Perform temperature conversion
      _resultKelvin = celcius + 273.15;
      _resultReamur = 0.8 * celcius;

      // Update UI with new results
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Konverter Suhu"),
        leading: Icon(Icons.access_alarm_rounded),
        backgroundColor: Colors.green,
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Suhu (Celcius)',
                hintText: 'Input Suhu (Celcius)',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Suhu Kelvin", style: TextStyle(fontSize: 20)),
                    Text(_resultKelvin.toString(), style: TextStyle(fontSize: 20)),
                  ],
                ),
                Column(
                  children: [
                    Text("Suhu Reamur", style: TextStyle(fontSize: 20)),
                    Text(_resultReamur.toString(), style: TextStyle(fontSize: 20)),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _calculateConversion,
              child: Text("Hitung Konversi Suhu"),
            ),
          ],
        ),
      ),
    );
  }
}
