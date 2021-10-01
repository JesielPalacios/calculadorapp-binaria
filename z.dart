import 'package:flutter/material.dart';

void camposConversor(input, Function convertirValores, String tipoNumero) {
  String pluralizar(String termino) {
    try {
      if (tipoNumero.endsWith('l')) {
        tipoNumero = '${tipoNumero}es';
      } else if (tipoNumero.endsWith('o')) {
        tipoNumero = '${tipoNumero}s';
      }
    } catch (e) {
      print(e);
    }
    return tipoNumero;
  }

  String capitalizar(String tipoNumero) {
    tipoNumero = pluralizar(tipoNumero);
    return "${tipoNumero[0].toUpperCase()}${tipoNumero.substring(1)}";
  }

// No funciona.
  //   String capitalizar(String tipoNumero) {
  //   print(tipoNumero);
  //   if (tipoNumero.endsWith('l')) {
  //     tipoNumero = '${tipoNumero}es';
  //   } else if (tipoNumero.endsWith('o')) {
  //     tipoNumero = '${tipoNumero}s';
  //   }
  //   return "${tipoNumero[0].toUpperCase()}${tipoNumero.substring(1)}";
  // }

  return Padding(
      padding: EdgeInsets.all(15.0),
      child: TextField(
          keyboardType: TextInputType.number,
          controller: input,
          style: TextStyle(fontSize: 20, color: Colors.green),
          onChanged: (String value) async => {
                convertirValores(input.text, '$tipoNumero'),
                print('value ' + value),
                print('input ' + input.text),
                print('------------')
              },
          decoration: InputDecoration(
            icon: Icon(Icons.checklist),
            labelText: "Toque para $tipoNumero",
            hintText: capitalizar(tipoNumero),
            helperText: "Sólo $tipoNumero.☝🏾",
            helperStyle: TextStyle(fontSize: 20.0),
          )));
}

mostrarBotonLimpiarCampos(limpiarCampos) {
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding:
                EdgeInsets.only(left: 22.5, right: 22.5, bottom: 15, top: 15),
            primary: Colors.red),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: "Limpiar campos ",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              WidgetSpan(
                child: Icon(
                  Icons.delete,
                  size: 22.5,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        onPressed: () => limpiarCampos()),
  );
}
