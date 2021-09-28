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
  var binario1;
  var binario2;
  var resultado;

  void controladorDeCampos(String valor, String inputCampoTexto) {
    setState(() {
      if (inputCampoTexto == 'binario1') {
        binario1 = int.parse(valor, radix: 2);
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
    String textoOperacion = "";

    if (operacion == 'sumar') {
      int suma = binario1 + binario2;
      resultado = suma.toRadixString(2);
      // resultado = binario1 + binario2;
      textoOperacion =
          'El resultado de la suma es ${resultado.padLeft(4, '0').toString()}';
    } else if (operacion == 'restar') {
      int suma = binario1 + binario2;
      resultado = suma.toRadixString(2);
      // resultado = binario1 - binario2;
      textoOperacion = 'El resultado de la resta es ${resultado.padLeft(4, '0').toString()}';
    }

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
              Clipboard.setData(new ClipboardData(text: resultado.toString()))
                  .then((_) {
                // Scaffold.of(context).showSnackBar(
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Copiado al portapepeles!")));
              });
            },
            child: Text("Copiar")),

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
    final ButtonStyle style =
        // ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20, color: Colors.white), primary: Colors.green);
        // ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20), primary: Colors.grey);
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
        body: Container(
            child: Center(
                child: ListView(
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  style: style,
                  child: Text("Sumar", style: TextStyle(color: Colors.green)),
                  onPressed: () => mostrarResultado('suma')),
              ElevatedButton(
                  style: style,
                  child: Text("Restar", style: TextStyle(color: Colors.grey)),
                  onPressed: () => mostrarResultado('resta')),
              ElevatedButton(
                  style: style,
                  child: Text("Limpiar campos",
                      style: TextStyle(color: Colors.red)),
                  onPressed: () => limpiarCampos()),
            ])
      ],
    ))));
  }
}
