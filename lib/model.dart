import 'package:flutter/material.dart';

class Esdeveniment {
  final DateTime horaInici, horaFinal;
  final String titol;
  final String? descripcio;

  const Esdeveniment(
      {required this.horaInici,
        required this.horaFinal,
        required this.titol,
        this.descripcio}
      );
}

class Calendario {
  static final Calendario _modelo = Calendario._internal();

  factory Calendario() {
    return _modelo;
  }
  Calendario._internal()
      : _titol = "",
        _descripcio = "",
        _horaInicial = const TimeOfDay(hour: 00, minute: 0),
        _horaFinal = const TimeOfDay(hour: 24, minute: 0);


  String _titol;
  String _descripcio;
  TimeOfDay _horaInicial;
  TimeOfDay _horaFinal;

  String get titol => _titol;

  String get descripcio => _descripcio;

  TimeOfDay get horaInicial => _horaInicial;

  TimeOfDay get horaFinal => _horaFinal;

  void setConfiguracion(
      {required String titol,
        required String descripcio,
        required TimeOfDay horaInicial,
        required TimeOfDay horaFinal}) {
    _titol = titol;
    _descripcio = descripcio;
    _horaInicial = horaInicial;
    _horaFinal = horaFinal;
  }
}
