import 'package:flutter/material.dart';

class EstructuraConversiones extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EstructuraConversiones();
  }
}

class _EstructuraConversiones extends State<EstructuraConversiones> {
  TextEditingController inputDecimales = TextEditingController();
  TextEditingController inputBinarios = TextEditingController();
  TextEditingController inputOctales = TextEditingController();
  TextEditingController inputHexadecimales = TextEditingController();

  void convertirValores(String value, String tipo) {
    setState(() {
      if (tipo == 'decimal') {
        inputBinarios.text = int.parse(value).toRadixString(2).padLeft(4, '0');
        inputOctales.text = int.parse(value).toRadixString(8);
        inputHexadecimales.text = int.parse(value).toRadixString(16);
      } else if (tipo == 'binario') {
        inputDecimales.text = int.parse(value, radix: 2).toString();
        inputOctales.text = int.parse(value, radix: 2).toRadixString(8);
        inputHexadecimales.text = int.parse(value, radix: 2).toRadixString(16);
      } else if (tipo == 'octal') {
        inputDecimales.text = int.parse(value, radix: 8).toString();
        inputBinarios.text =
            int.parse(value, radix: 8).toRadixString(2).padLeft(4, '0');
        inputHexadecimales.text = int.parse(value, radix: 8).toRadixString(16);
      } else if (tipo == 'hexadecimal') {
        inputDecimales.text = int.parse(value, radix: 16).toString();
        inputBinarios.text =
            int.parse(value, radix: 16).toRadixString(2).padLeft(4, '0');
        inputOctales.text = int.parse(value, radix: 16).toRadixString(8);
      }
    });
  }

  void limpiarCampos() {
    inputDecimales.text = "";
    inputBinarios.text = "";
    inputOctales.text = "";
    inputHexadecimales.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Parcial Programación Móvil - Punto #1")),
        body: Container(
            child: Center(
                child: ListView(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Align(alignment: Alignment.center),
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                      keyboardType: TextInputType.number,
                      controller: inputDecimales,
                      style: TextStyle(fontSize: 20, color: Colors.green),
                      onChanged: (String value) async =>
                          convertirValores(value, 'decimal'),
                      decoration: InputDecoration(
                        icon: Icon(Icons.checklist),
                        labelText: "Toque para ingresar un número en decimal",
                        hintText: "Decimal",
                        helperText: "En este campo sólo decimales.☝🏾",
                        helperStyle: TextStyle(fontSize: 20.0),
                      ))),
              Row(children: <Widget>[
                Expanded(child: Divider()),
              ]),
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                      keyboardType: TextInputType.number,
                      controller: inputBinarios,
                      style: TextStyle(fontSize: 20, color: Colors.green),
                      onChanged: (String value) async =>
                          convertirValores(value, 'binario'),
                      decoration: InputDecoration(
                        icon: Icon(Icons.checklist),
                        labelText: "Toque para ingresar un número en binario",
                        hintText: "Binario",
                        helperText: "En este campo sólo binarios.☝🏾",
                        helperStyle: TextStyle(fontSize: 20.0),
                      ))),
              Row(children: <Widget>[
                Expanded(child: Divider()),
              ]),
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                      keyboardType: TextInputType.number,
                      controller: inputOctales,
                      style: TextStyle(fontSize: 20, color: Colors.green),
                      onChanged: (String value) async =>
                          convertirValores(value, 'octal'),
                      decoration: InputDecoration(
                        icon: Icon(Icons.checklist),
                        labelText: "Toque para ingresar un número en octal",
                        hintText: "Octal",
                        helperText: "En este campo sólo octales.☝🏾",
                        helperStyle: TextStyle(fontSize: 20.0),
                      ))),
              Row(children: <Widget>[
                Expanded(child: Divider()),
              ]),
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                      keyboardType: TextInputType.number,
                      controller: inputHexadecimales,
                      style: TextStyle(fontSize: 20, color: Colors.green),
                      onChanged: (String value) async =>
                          convertirValores(value, 'hexadecimal'),
                      decoration: InputDecoration(
                        icon: Icon(Icons.checklist),
                        labelText:
                            "Toque para ingresar un número en hexadecimal",
                        hintText: "hexadecimal",
                        helperText: "En este campo sólo hexadecimales.☝🏾",
                        helperStyle: TextStyle(fontSize: 20.0),
                      ))),
              Row(children: <Widget>[
                Expanded(child: Divider()),
              ]),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.orange),
                        padding: EdgeInsets.only(
                            left: 71, right: 71, bottom: 15, top: 15),
                        primary: Colors.red),
                    child: Text("Limpiar campos 🕳"),
                    onPressed: () => limpiarCampos()),
              ),
            ])
          ],
        ))));
  }
}
