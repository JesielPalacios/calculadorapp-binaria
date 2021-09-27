import 'package:flutter/material.dart';

class VistaInputYAlert extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VistaInputYAlert();
  }
}

class _VistaInputYAlert extends State<VistaInputYAlert> {
  TextEditingController controladorInput = TextEditingController();
  List<Widget> valoresIngresados = [];

  void agregarValorIngresado() {
    String valorIngresado = controladorInput.text;
    setState(() {
      var textoIngresado = Text(valorIngresado);
      valoresIngresados.add(textoIngresado);
      controladorInput.text = "";
      print("habilitado");
    });
  }

  void eliminarPalabra() {
    if (valoresIngresados.isNotEmpty) {
      setState(() {
        valoresIngresados.removeLast();
      });
    }
    Navigator.pop(context);
  }

  void mostrarAlert() {
    AlertDialog dialog = AlertDialog(
      content: Text("¿Está seguro que dese eliminar esa palabra?"),
      actions: [
        TextButton(
            onPressed: () {
              eliminarPalabra();
            },
            child: Text("Sí")),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("No")),
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
        appBar: AppBar(
          title: Text("Ejemplo de TextField y Alert"),
        ),
        body: Container(
            child: Column(children: [
          TextField(
              controller: controladorInput,
              decoration: InputDecoration(
                hintText: "Ingrese un texto",
                helperText: "El texto digitado será mostrado más abajo",
                helperStyle: TextStyle(fontSize: 14.0),
              )),
          Row(
            children: [
              ElevatedButton(
                  child: Text("Agregar palabra"),
                  onPressed: () {
                    agregarValorIngresado();
                  }),
              ElevatedButton(
                  child: Text("Eliminar palabra"),
                  onPressed: valoresIngresados.isNotEmpty
                      ? () {
                          mostrarAlert();
                        }
                      : null),
            ],
          ),
          Column(
            children: valoresIngresados,
          ),
        ])));
  }
}
