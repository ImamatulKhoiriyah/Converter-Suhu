import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(mykalkulatorsuhu());
}

class mykalkulatorsuhu extends StatefulWidget {

  @override
  State<mykalkulatorsuhu> createState() => _mykalkulatorsuhuState();
}

class _mykalkulatorsuhuState extends State<mykalkulatorsuhu> {
  TextEditingController txtinput = new TextEditingController();

  double _input = 0;

  double _kelvin = 0;

  double _fahrenheit = 0;

  double _reamur = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar( 
          title: Text("Konverter Suhu by : Imamatul Khoiriyah"),
          // theme: ThemeData( primarySwatch: Colors.blue, visualDensity: VisualDensity.adaptivePlatformDensity,)
        
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 9.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Masukkan Suhu Dalam Celcius'),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: txtinput,
                    keyboardType: TextInputType.number,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("Kelvin", style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                      Text('$_kelvin', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Fahrenheit", style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                      Text('$_fahrenheit', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Reamur", style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                      Text('$_reamur', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: 500,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xffF18265)),
                    child: Text('Konversi Suhu'),
                    onPressed: konversi,
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  void konversi() {
      setState(() {
        _input = double.parse(txtinput.text);
        _reamur = 4 / 5 * _input;
        _fahrenheit = 9 /5 * _input + 32;
        _kelvin = _input + 273;
      });
    }
}