import 'package:flutter/material.dart';
import 'package:tarea2/imcScreen.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

void main() => runApp(MyApp());
var imc = IMC();

class _MyAppState extends State<MyApp> {
  var colorMujer = (imc.sexo == "Mujer") ? Colors.pink : Colors.grey;
  var colorHombre = Colors.grey;
  var peso = imc.peso;
  var altura = imc.altura;
  final fieldText = TextEditingController();
  final fieldText2 = TextEditingController();

  void clearText() {
    fieldText.clear();
    fieldText2.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calcular IMC',
      home: Builder(builder: (context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.green,
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        clearText();
                      },
                      icon: Icon(Icons.delete))
                ],
                title: Text(
                  'Calcular IMC',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(children: [
                  Text(
                    "Ingrese sus datos para calcular el IMC",
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          iconSize: 40,
                          color: colorHombre,
                          onPressed: () {
                            setState(() {
                              imc.setSexo("Hombre");
                              colorHombre = Colors.blue;
                              colorMujer = Colors.grey;
                            });

                            print(imc.sexo);
                          },
                          icon: Icon(Icons.male_sharp)),
                      IconButton(
                          iconSize: 40,
                          color: colorMujer,
                          onPressed: () {
                            setState(() {
                              imc.setSexo("Mujer");
                              colorHombre = Colors.grey;
                              colorMujer = Colors.pink;
                            });

                            print(imc.sexo);
                          },
                          icon: Icon(Icons.female_sharp))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 2,
                          child: IconButton(
                              iconSize: 40,
                              color: Colors.blue,
                              onPressed: () {},
                              icon: Icon(Icons.height_sharp)),
                        ),
                        Expanded(
                            flex: 10,
                            child: TextField(
                              controller: fieldText,
                              onChanged: (value) {
                                imc.setAltura(double.parse(value));
                                print(imc.altura);
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Ingresar altura (Metros)"),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0, bottom: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 2,
                          child: IconButton(
                              iconSize: 40,
                              color: Colors.pink,
                              onPressed: () {},
                              icon: Icon(Icons.monitor_weight_sharp)),
                        ),
                        Expanded(
                            flex: 10,
                            child: TextField(
                              controller: fieldText2,
                              onChanged: (value) {
                                imc.setPeso(double.parse(value));
                                print(imc.peso);
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Ingresar peso (Kilogramos)"),
                              ),
                            ))
                      ],
                    ),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 50)),
                      onPressed: () {
                        imc.setIMC(imc.peso, imc.altura);
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              'Tu IMC: ' + imc.getIMC().toString(),
                              style: TextStyle(fontSize: 24),
                            ),
                            content: SizedBox(
                              height: MediaQuery.of(context).size.height * .33,
                              child: Column(
                                children: [
                                  Text(
                                    'Tabla del IMC para: ' + imc.sexo + "\n",
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  Text(
                                    imc.sexo == "Hombre"
                                        ? imc.tablaHombres
                                        : imc.tablaMujeres,
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.green),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Regresar'))
                            ],
                          ),
                        );
                      },
                      child: Text(
                        "Calcular",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ))
                ]),
              ),
            ));
      }),
    );
  }
}
