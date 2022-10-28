import 'package:flutter/material.dart';
import 'model.dart';

class EditarEsdevenimentForm extends StatefulWidget {
  const EditarEsdevenimentForm({Key? key}) : super(key: key);

  @override
  State<EditarEsdevenimentForm> createState() => _EditarEsdevenimentFormState();
}

class _EditarEsdevenimentFormState extends State<EditarEsdevenimentForm> {
  final _clauFormulari = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edició esdeveniment"),
      ),
      body: getFormulari(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          if (_clauFormulari.currentState != null &&
              _clauFormulari.currentState!.validate()) {
            _clauFormulari.currentState!.save();
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }

  Widget getFormulari() {
    return Form(
        key: _clauFormulari,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "Títol"),
                    onSaved: (valor) => SettingsController().setTitulo(valor!),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    maxLines: null,
                    expands: true,
                    decoration: const InputDecoration(
                      labelText: "Descripció",
                      alignLabelWithHint: true,
                    ),
                    onSaved: (valor) =>
                        SettingsController().setDescripcio(valor!),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class SettingsController {
  String? _titulo;
  String? _descripcio;
  TimeOfDay? _horaInicial;
  TimeOfDay? _horaFinal;

  void setTitulo(String elTitulo) {
    _titulo = elTitulo;
  }

  void setDescripcio(String descripcio) {
    _descripcio = descripcio;
  }

  void setIHoraInicial(TimeOfDay horaInicial) {
    _horaInicial = horaInicial;
  }

  void setHoraFinal(TimeOfDay horaFinal) {
    _horaFinal = horaFinal;
  }

  @override
  String toString() {
    return "$_titulo: $_descripcio: ${_horaInicial?.hour ?? "null"}:${_horaInicial?.minute ?? "null"}: ${_horaFinal?.hour ?? "null"}:${_horaFinal?.minute ?? "null"}";
  }

  void save() {
    assert(
        _titulo != null &&
            _descripcio != null &&
            _horaInicial != null &&
            _horaFinal != null,
        "Cap paràmetre pot ser null quan es crida a aquesta funció");
    Calendario().setConfiguracion(
        titol: _titulo!,
        descripcio: _descripcio!,
        horaInicial: _horaInicial!,
        horaFinal: _horaFinal!);
  }
}
