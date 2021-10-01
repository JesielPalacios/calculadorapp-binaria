import 'package:flutter/material.dart';
import 'package:parcial_prog_movil/pages/menuTabs/widgesPersonalizados/estilosBotones.dart';

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
    print('value desde main: ' + value);
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
              // camposConversor(inputDecimales, convertirValores, 'decimal'),
              // camposConversor(inputBinarios, convertirValores, 'binario'),
              // camposConversor(inputOctales, convertirValores, 'octal'),
              // camposConversor(
                  // inputHexadecimales, convertirValores, 'hexadecimal'),
              mostrarBotonLimpiarCampos(limpiarCampos)
            ])
          ],
        ))));
  }
}
