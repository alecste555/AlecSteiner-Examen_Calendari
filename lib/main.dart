import 'package:examen_calendari/editar_esdeveniment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: "Calendari de Alec Steiner",
      ),

    );
  }
}

class Esdeveniment {
  final DateTime horaInici, horaFinal;
  final String titol;
  final String? descripcio;

  Esdeveniment(
      {required this.horaInici,
      required this.horaFinal,
      required this.titol,
      this.descripcio});
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final esdeveniments = <Esdeveniment>[
    Esdeveniment(
        horaInici: DateTime(2022, 11, 1),
        horaFinal: DateTime(2022, 11, 1, 23, 59),
        titol: "Festiu",
        descripcio: "Tots els Sants"),
    Esdeveniment(
        horaInici: DateTime(2022, 12, 6),
        horaFinal: DateTime(2022, 12, 6, 23, 59),
        titol: "Festiu",
        descripcio: "Dia de la Constitució"),
    Esdeveniment(
        horaInici: DateTime(2022, 12, 8),
        horaFinal: DateTime(2022, 12, 7, 23, 59),
        titol: "Festiu",
        descripcio: "Inmaculada Concepció"),
    Esdeveniment(
        horaInici: DateTime(2022, 12, 9),
        horaFinal: DateTime(2022, 12, 8, 23, 59),
        titol: "Festiu",
        descripcio: "2n día lliure disposició"),
    Esdeveniment(
        horaInici: DateTime(2022, 11, 22, 17, 0),
        horaFinal: DateTime(2022, 11, 22, 19, 20),
        titol: "Examen",
        descripcio: "Examen dispositius mòbils"),
    Esdeveniment(
        horaInici: DateTime(2022, 11, 22, 19, 20),
        horaFinal: DateTime(2022, 11, 22, 21, 20),
        titol: "Entrega",
        descripcio: "Entrega projecte inicial"),
    Esdeveniment(
        horaInici: DateTime(2022, 11, 30, 16, 0),
        horaFinal: DateTime(2022, 11, 30, 17, 0),
        titol: "Entrega",
        descripcio: "Pràctica programació serveis"),
    Esdeveniment(
        horaInici: DateTime(2022, 11, 30, 19, 20),
        horaFinal: DateTime(2022, 11, 30, 20, 20),
        titol: "Entrega",
        descripcio: "Planificació inicial síntesi"),
    Esdeveniment(
        horaInici: DateTime(2022, 12, 12, 15, 0),
        horaFinal: DateTime(2022, 12, 12, 16, 0),
        titol: "Examen",
        descripcio: "Test sistemes gestió"),
    Esdeveniment(
        horaInici: DateTime(2022, 12, 12, 18, 20),
        horaFinal: DateTime(2022, 12, 12, 19, 20),
        titol: "Entrega",
        descripcio: "Exercicis dispositius mòbils"),
    Esdeveniment(
        horaInici: DateTime(2022, 11, 6, 13, 0),
        horaFinal: DateTime(2022, 11, 6, 19, 0),
        titol: "Dinar familiar",
        descripcio: "Aniversari tia Julieta. Comprar regal!!"),
    Esdeveniment(
        horaInici: DateTime(2022, 11, 12, 22, 0),
        horaFinal: DateTime(2022, 11, 13, 2, 0),
        titol: "Concert",
        descripcio: "Músics al carrer de Gavà"),
    Esdeveniment(
        horaInici: DateTime(2022, 11, 19, 10, 0),
        horaFinal: DateTime(2022, 11, 19, 19, 0),
        titol: "Hackaton",
        descripcio: "Reptes ODS 2022"),
  ];

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
          LlistatEsdevenimentsWidget(llistaEsdeveniments: widget.esdeveniments),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("No implementat.")));
        },
        tooltip: 'Afegir esdeveniment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class LlistatEsdevenimentsWidget extends StatelessWidget {
  const LlistatEsdevenimentsWidget({
    Key? key,
    required this.llistaEsdeveniments,
  }) : super(key: key);

  final List<Esdeveniment> llistaEsdeveniments;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        for (Esdeveniment lEsdeveniment in llistaEsdeveniments)
          EsdevenimentWidget(lEsdeveniment)
      ],
    );
  }
}

class EsdevenimentWidget extends StatelessWidget {
  const EsdevenimentWidget(
    this.esdeveniment, {
    Key? key,
  }) : super(key: key);

  final Esdeveniment esdeveniment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          "${DateFormat("yyyy-MM-dd HH:mm").format(esdeveniment.horaInici)}: ${esdeveniment.titol}: ${esdeveniment.descripcio}"),
    );
  }
}
