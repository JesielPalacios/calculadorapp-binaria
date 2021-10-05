import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:CalculadorApp/pages/menuTabs/widgesPersonalizados/estilosBotones.dart';

class EstructuraOperacionesLogicas extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return __EstructuraOperacionesLogicas();
  }
}

class __EstructuraOperacionesLogicas
    extends State<EstructuraOperacionesLogicas> {
  TextEditingController valor1 = TextEditingController();
  TextEditingController valor2 = TextEditingController();
  int binario1 = 0;
  int binario2 = 0;
  int resultado = 0;
  List<String> errores = [
    'Ingrese los dos números para hacer las operaciones.',
    'La longitud de los dos números binarios deben ser iguales, verifique e intente nuevamente',
  ];

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

  void mostrarErrores(String tipoError) {
    String errorTexto = '';
    if (tipoError == 'datos-incompletos') {
      errorTexto = errores[0];
    } else if (tipoError == 'longitudes-diferentes') {
      errorTexto = errores[1];
    }
    AlertDialog dialog = AlertDialog(
      title: Text(
        '                            ❌ Error! ❌',
        style: TextStyle(color: Colors.orange),
      ),
      content: Text(errorTexto, style: TextStyle(color: Colors.white)),
      elevation: 24.0,
      backgroundColor: Colors.blue,
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15.0),
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
  }

  void operar(String operacion) {
    String textoOperacion = '';
    String accion = '';

    setState(() {
      if (binario1 <= 0 && binario2 <= 0) {
        mostrarErrores('datos-incompletos');
      } else if (binario1.bitLength == binario2.bitLength) {
        if (operacion == "and") {
          resultado = binario1 & binario2;
          accion = 'AND';
        } else if (operacion == "or") {
          resultado = binario1 | binario2;
          accion = 'OR';
        } else if (operacion == "xor") {
          resultado = binario1 ^ binario2;
          accion = 'XOR';
        }
        textoOperacion =
            'Resultados de la operación bit a bit (Bitwise operation) $accion es:\n\n• En decimal: $resultado\n\n• En binario: ' +
                resultado.toRadixString(2).padLeft(4, '0');

        AlertDialog dialog = AlertDialog(
          content: Text(textoOperacion),
          actions: [
            TextButton(
                onPressed: () {
                  Clipboard.setData(new ClipboardData(
                          text: resultado.toRadixString(2).padLeft(100, '0')))
                      .then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Copiado al portapepeles!")));
                  });
                },
                child: Text("Copiar número binario")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Salir")),
          ],
        );

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return dialog;
            });
      } else {
        mostrarErrores('longitudes-diferentes');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
                child: ListView(
      children: [
        Form(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Align(alignment: Alignment.center),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: valor1,
              style: TextStyle(fontSize: 15, color: Colors.green),
              onChanged: (String value) async =>
                  controladorDeCampos(value, 'binario1'),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.blue)),
                prefixIcon: Icon(
                  Icons.exposure_zero,
                  color: Colors.black,
                ),
                labelText: "Ingrese aquí el primer binario",
                hintText: "Binario 1",
                hintStyle: TextStyle(color: Colors.black),
                helperText: "En este campo sólo binarios.☝🏾",
                helperStyle: TextStyle(fontSize: 15.0),
              ),
            ),
          ),
          Row(children: <Widget>[
            Expanded(child: Divider(height: 5)),
          ]),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: valor2,
              style: TextStyle(fontSize: 15, color: Colors.green),
              onChanged: (String value) async =>
                  controladorDeCampos(value, 'binario2'),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                prefixIcon: Icon(Icons.exposure_plus_1, color: Colors.black),
                labelText: "Ingrese aquí el segundo binario",
                hintText: "Binario 2",
                hintStyle: TextStyle(color: Colors.black),
                helperText: "En este campo sólo binarios.☝🏾",
                helperStyle: TextStyle(fontSize: 15.0),
              ),
            ),
          ),
          boton(operar, 'and', 'Operación AND'),
          boton(operar, 'or', ' Operación OR '),
          boton(operar, 'xor', 'Operación XOR'),
        ]))
      ],
    ))));
  }
}
