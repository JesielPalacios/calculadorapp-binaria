// import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EstructuraOperacionesBinarios extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EstructuraOperacionesBinarios();
  }
}

class _EstructuraOperacionesBinarios
    extends State<EstructuraOperacionesBinarios> {
  TextEditingController inputBinario1 = TextEditingController();
  TextEditingController inputBinario2 = TextEditingController();
  int binario1 = 0;
  int binario2 = 0;
  int resultado = 0;
  String textoOperacion = '';
  String accion = '';

  void controladorDeCampos(String valor, String inputCampoTexto) {
    setState(() {
      if (inputCampoTexto == 'binario1') {
        binario1 = int.parse(valor, radix: 2);
        print(binario1);
      } else if (inputCampoTexto == 'binario2') {
        binario2 = int.parse(valor, radix: 2);
      }
    });
  }

  void limpiarCampos() {
    inputBinario1.text = "";
    inputBinario2.text = "";
  }

  void operar(String operacion) {
    setState(() {
      if (binario1 <= 0 && binario2 <= 0) {
        AlertDialog dialog = AlertDialog(
          title: Text(
            '                            ❌ Errro! ❌',
            style: TextStyle(color: Colors.orange),
          ),
          content: Text(
              'Ingrese por lo menos los dos números para hacer las operaciones.',
              style: TextStyle(color: Colors.white)),
          elevation: 24.0,
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Salir",
                    style: TextStyle(color: Colors.white.withOpacity(0.6)))),
          ],
        );

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return dialog;
            });
      } else {
        if (operacion == 'suma') {
          resultado = binario1 + binario2;
          accion = 'suma';
        } else if (operacion == 'resta') {
          accion = 'resta';
          resultado = binario1 - binario2;
        }
        textoOperacion = '• En decimal: $resultado\n\n• En binario: ' +
            resultado.toRadixString(2).padLeft(4, '0').toString();

        AlertDialog dialog = AlertDialog(
          title: Text(
            'El resultado de la $accion es:',
          ),
          content: Text(textoOperacion, style: TextStyle(color: Colors.white)),
          // contentTextStyle: TextStyle(color: Colors.white),
          elevation: 24.0,
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
          actions: [
            TextButton(
                onPressed: () {
                  Clipboard.setData(new ClipboardData(
                          text: resultado
                              .toRadixString(2)
                              .padLeft(100, '0')
                              .toString()))
                      .then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Copiado al portapepeles!",
                            style: TextStyle(color: Colors.white))));
                  });
                },
                child: Text("Copiar número binario")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Salir",
                    style: TextStyle(color: Colors.white.withOpacity(0.6)))),
          ],
        );

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return dialog;
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        // ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20, color: Colors.white), primary: Colors.green);
        // ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20), primary: Colors.grey);
        ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
            // padding: EdgeInsets.all(25.0),
            // padding: EdgeInsets.symmetric(),
            padding: EdgeInsets.only(left: 65, right: 65, bottom: 15, top: 15),
            primary: Colors.green);

    final ButtonStyle eliminar = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20, color: Colors.orange),
        padding: EdgeInsets.only(left: 22.5, right: 22.5, bottom: 15, top: 15),
        primary: Colors.red);

    return Scaffold(
        appBar: AppBar(title: Text("Parcial Programación Móvil - Punto #2")),
        body: Container(
            child: Center(
                child: ListView(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Align(alignment: Alignment.center),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                    keyboardType: TextInputType.number,
                    controller: inputBinario1,
                    style: TextStyle(fontSize: 20, color: Colors.green),
                    onChanged: (String value) =>
                        controladorDeCampos(value, 'binario1'),
                    decoration: InputDecoration(
                      icon: Icon(Icons.checklist),
                      labelText: "Toque para ingresar primer binario",
                      hintText: "Binario 1",
                      helperText: "En este campo sólo binarios.☝🏾",
                      helperStyle: TextStyle(fontSize: 20.0),
                    ))
              ),
              Row(children: <Widget>[
                Expanded(child: Divider()),
              ]),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                    keyboardType: TextInputType.number,
                    controller: inputBinario2,
                    style: TextStyle(fontSize: 20, color: Colors.green),
                    onChanged: (String value) =>
                        controladorDeCampos(value, 'binario2'),
                    decoration: InputDecoration(
                      icon: Icon(Icons.checklist),
                      labelText: "Toque para ingresar segundo binario",
                      hintText: "Binario 2",
                      helperText: "En este campo sólo binarios.☝🏾",
                      helperStyle: TextStyle(fontSize: 20.0),
                    )),
              ),
              Row(children: <Widget>[
                Expanded(child: Divider()),
              ]),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                    style: style,
                    child: Text("Sumar ➕"),
                    onPressed: () => operar('suma')),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: ElevatedButton(
                    style: style,
                    child: Text("Restar ➖"),
                    onPressed: () => operar('resta')),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                    style: eliminar,
                    child: Text("Limpiar campos 🕳",
                        style: TextStyle(color: Colors.black)),
                    onPressed: () => limpiarCampos()),
              ),
            ])
          ],
        ))));
  }
}
