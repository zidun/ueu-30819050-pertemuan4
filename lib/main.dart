import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Lingkaran',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Kalkulator Lingkaran'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double jari_jari  = 0;
  double diameter = 0;
  double luas = 0;
  double keliling = 0;

  final TextEditingController _textJariJari = TextEditingController();
  final TextEditingController _textDiameter = TextEditingController();

  void _calculate() {
    setState(() {
      luas = (22 * jari_jari * jari_jari)/7;
      keliling = 2 * (22/7) * jari_jari;
      _textJariJari.text = "${jari_jari}";
      _textDiameter.text = "${diameter}";
    });
  }

  void _reset() {
    setState(() {
      _textJariJari.text = "";
      _textDiameter.text = "";
      luas = 0;
      keliling = 0;
      jari_jari = 0;
      diameter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Text("Aplikasi Unit Conversion Bangun Datar"),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("NIM : 30819050"),
                  Text("Nama : Muhammad Ramdan")
                ],
              ),
            ),
          ],
        )
      ),
        appBar: AppBar(
          title: Text("Kalkulator Lingkaran"),
        ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(top: 24),
        physics: const BouncingScrollPhysics(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 Container(
                   alignment: Alignment.center,
                   width: size.width,
                   height: size.width/2,
                   decoration: const BoxDecoration(
                     image: DecorationImage(
                         fit: BoxFit.fitHeight,
                         image: AssetImage("images/circle.jpeg")
                     )
                   ),
                 ),
                  SizedBox(height: 24),
                  Text("Masukan Jari-Jari atau diameter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  SizedBox(height: 24),
                  Container(height: 12, width: size.width, color: Colors.green),
                  Padding(
                      padding: EdgeInsets.all(24), 
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Text("Jari-Jari (r)", textAlign: TextAlign.left,),
                              TextField(
                                controller: _textJariJari,
                                onChanged: (txt) {
                                  setState(() {
                                    jari_jari = double.parse(txt);
                                    diameter = jari_jari * 2;
                                  });
                                },
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    suffix: Text('cm'),
                                    filled: true,
                                    hintText: 'Masukan Jari-jari'
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Text("Atau", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Diameter (d)", textAlign: TextAlign.left,),
                              TextField(
                                controller: _textDiameter,
                                onChanged: (txt) {
                                  setState(() {
                                    diameter = double.parse(txt);
                                    jari_jari = diameter/2;
                                  });
                                },
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                    suffix: Text('cm'),
                                    filled: true,
                                    hintText: 'Masukan diameter'
                                ),
                              ),
                            ],
                          ),
                        ],
                      ) 
                  ),
                  Container(height: 12, width: size.width, color: Colors.green),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: _calculate,
                            child: Text("Hitung")
                        ),
                        SizedBox(width: 24),
                        ElevatedButton(
                            onPressed: _reset,
                            child: Text("Reset")
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        children: <Widget>[
                          Text("Luas : ${luas}", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                          SizedBox(height: 8),
                          Text("Keliling : ${keliling}", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                        ],
                      )
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
