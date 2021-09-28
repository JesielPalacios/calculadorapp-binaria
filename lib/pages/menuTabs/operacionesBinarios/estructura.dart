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

  void mostrarResultado(String operacion) {
    String operacionFinal = operacion;
    operar(binario1, binario2, operacionFinal);
  }

  void limpiarCampos() {
    inputBinario1.text = "";
    inputBinario2.text = "";
  }

  void operar(int binario1, int binario2, String operacion) {
    // String textoOperacion = 'El resultado de la suma \n  \n \n \n \nes \n ${binario1 + binario2}';
    String textoOperacion = '';
    String operacion2 = '';

    setState(() {
      if (operacion == 'sumar') {
        resultado = binario1 + binario2;
        operacion2 = 'suma';
      } else if (operacion == 'restar') {
        operacion2 = 'resta';
        resultado = binario1 - binario2;
      }
      textoOperacion =
          'El resultado de la $operacion2 es \n\n• $resultado en decimal.\n\n• ' +
              resultado.toRadixString(2).padLeft(4, '0').toString() +
              ' en binario.';
    });

    AlertDialog dialog = AlertDialog(
      content: Text(textoOperacion),
      actions: [
        // TextButton(
        //     onPressed: () {
        //       ClipboardManager.copyToClipBoard(suma.toString()).then((result) {
        //         final snackBar = SnackBar(
        //           content: Text('Copiado al portapapeles.'),
        //           action: SnackBarAction(
        //             label: 'Undo',
        //             onPressed: () {},
        //           ),
        //         );
        //         // Scaffold.of(context).showSnackBar(snackBar);
        //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //       });
        //     },
        //     child: Text("Copiar")),

        TextButton(
            onPressed: () {
              Clipboard.setData(new ClipboardData(
                      text: resultado
                          .toRadixString(2)
                          .padLeft(4, '0')
                          .toString()))
                  .then((_) {
                // Scaffold.of(context).showSnackBar(
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
                child: ListView(
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(alignment: Alignment.center),
              TextField(
                  keyboardType: TextInputType.number,
                  controller: inputBinario1,
                  style: TextStyle(fontSize: 14, color: Colors.green),
                  onChanged: (String value) =>
                      controladorDeCampos(value, 'binario1'),
                  decoration: InputDecoration(
                    icon: Icon(Icons.checklist),
                    labelText: "Toque para ingresar primer binario",
                    hintText: "Binario 2",
                    helperText: "En este campo sólo binarios.☝🏾",
                    helperStyle: TextStyle(fontSize: 14.0),
                  )),
              Row(children: <Widget>[
                Expanded(child: Divider()),
              ]),
              TextField(
                  keyboardType: TextInputType.number,
                  controller: inputBinario2,
                  style: TextStyle(fontSize: 14, color: Colors.green),
                  onChanged: (String value) =>
                      controladorDeCampos(value, 'binario2'),
                  decoration: InputDecoration(
                    icon: Icon(Icons.checklist),
                    labelText: "Toque para ingresar segundo binario",
                    hintText: "Binario 2",
                    helperText: "En este campo sólo binarios.☝🏾",
                    helperStyle: TextStyle(fontSize: 14.0),
                  )),
              Row(children: <Widget>[
                Expanded(child: Divider()),
              ]),
              ElevatedButton(
                  child: Text("Sumar", style: TextStyle(color: Colors.red)),
                  onPressed: () => mostrarResultado('sumar')),
              ElevatedButton(
                  child: Text("Restar", style: TextStyle(color: Colors.red)),
                  onPressed: () => mostrarResultado('restar')),
              ElevatedButton(
                  child: Text("Limpiar campos",
                      style: TextStyle(color: Colors.red)),
                  onPressed: () => limpiarCampos()),
            ])
      ],
    ))));
  }
}