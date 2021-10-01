import 'package:flutter/material.dart';

mostrarBotonLimpiarCampos(limpiarCampos) {
  return Padding(
    padding: EdgeInsets.all(15.0),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding:
                EdgeInsets.only(left: 22.5, right: 22.5, bottom: 15, top: 15),
            primary: Colors.blue),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: "Limpiar campos ",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
              WidgetSpan(
                child: Icon(
                  Icons.delete,
                  size: 22.5,
                ),
              )
            ],
          ),
        ),
        onPressed: () => limpiarCampos()),
  );
}

boton(Function funcion, String operacion, String texto) {
  return Padding(
    padding: EdgeInsets.only(bottom: 15),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding:
                EdgeInsets.only(left: 22.5, right: 22.5, bottom: 15, top: 15),
            primary: Colors.blue),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: texto,
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ],
          ),
        ),
        onPressed: () => funcion('$operacion')),
  );
}
