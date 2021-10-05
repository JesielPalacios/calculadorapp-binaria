import 'package:flutter/material.dart';
import 'package:CalculadorApp/pages/menuTabs/widgesPersonalizados/estilosBotones.dart';

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
        inputDecimales.text = int.parse(value, radix: 16).toString();
        inputBinarios.text =
            int.parse(value, radix: 16).toRadixString(2).padLeft(4, '0');
        inputHexadecimales.text = int.parse(value, radix: 16).toRadixString(16);
      } else if (tipo == 'hexadecimal') {
        inputDecimales.text = int.parse(value, radix: 16).toString();
        inputBinarios.text =
            int.parse(value, radix: 16).toRadixString(2).padLeft(4, '0');
        inputOctales.text = int.parse(value, radix: 16).toRadixString(8);
      }
    });
  }

  void limpiarCampos([dynamic valorDefecto]) {
    inputDecimales.text = "";
    inputBinarios.text = "";
    inputOctales.text = "";
    inputHexadecimales.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
                child: ListView(
      children: [
        Column(children: [
          Padding(
              padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
              child: TextField(
                  keyboardType: TextInputType.number,
                  controller: inputDecimales,
                  style: TextStyle(fontSize: 15, color: Colors.green),
                  onChanged: (String value) async =>
                      convertirValores(value, 'decimal'),
                  decoration: InputDecoration(
                    icon: Icon(Icons.checklist),
                    labelText: "Toque para ingresar decimal",
                    hintText: "Decimal",
                    helperText: "Sólo decimales.☝🏾",
                    helperStyle: TextStyle(fontSize: 15),
                  ))),
          Row(children: <Widget>[
            Expanded(child: Divider(height: 5)),
          ]),
          Padding(
              padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
              child: TextField(
                  keyboardType: TextInputType.number,
                  controller: inputBinarios,
                  style: TextStyle(fontSize: 15, color: Colors.green),
                  onChanged: (String value) async =>
                      convertirValores(value, 'binario'),
                  decoration: InputDecoration(
                    icon: Icon(Icons.checklist),
                    labelText: "Toque para ingresar binario",
                    hintText: "Binario",
                    helperText: "Sólo binarios.☝🏾",
                    helperStyle: TextStyle(fontSize: 15),
                  ))),
          Row(children: <Widget>[
            Expanded(child: Divider(height: 5)),
          ]),
          Padding(
              padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
              child: TextField(
                  keyboardType: TextInputType.number,
                  controller: inputOctales,
                  style: TextStyle(fontSize: 15, color: Colors.green),
                  onChanged: (String value) async =>
                      convertirValores(value, 'octal'),
                  decoration: InputDecoration(
                    icon: Icon(Icons.checklist),
                    labelText: "Toque para ingresar octal",
                    hintText: "Octal",
                    helperText: "Sólo octales.☝🏾",
                    helperStyle: TextStyle(fontSize: 15),
                  ))),
          Row(children: <Widget>[
            Expanded(child: Divider(height: 5)),
          ]),
          Padding(
              padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
              child: TextField(
                  keyboardType: TextInputType.number,
                  controller: inputHexadecimales,
                  style: TextStyle(fontSize: 15, color: Colors.green),
                  onChanged: (String value) async =>
                      convertirValores(value, 'hexadecimal'),
                  decoration: InputDecoration(
                    icon: Icon(Icons.checklist),
                    labelText: "Toque para ingresar hexadecimal",
                    hintText: "hexadecimal",
                    helperText: "Sólo hexadecimales.☝🏾",
                    helperStyle: TextStyle(fontSize: 15),
                  ))),
          mostrarBotonLimpiarCampos(limpiarCampos)
        ])
      ],
    ))));
  }
}
