import 'package:flutter/material.dart';
import 'package:Androidlab/pages/menu_page.dart';


class PiramegiptoPage extends StatefulWidget {
  const PiramegiptoPage({Key? key}) : super(key: key);

  @override
  _PiramegiptoPageState createState() => _PiramegiptoPageState();
}

class _PiramegiptoPageState extends State<PiramegiptoPage> {
  void initState() {
    //pasarPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AndroidLab',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Detalle Sitio Turistico'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 15),
              const Text('Piramides de Egipto', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
          Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),
          image: const DecorationImage (image: AssetImage("assets/images/piramegipto.jpg"), fit: BoxFit.cover)
          ),
          width: double.maxFinite,
          height: 180,
          ) ,
              const SizedBox(height: 15),
              const Text('Horario: 24 Horas',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),
              const SizedBox(height: 10),
              const Text(
                  'Temperatura: El clima de Egipto tiene dos estaciones, un invierno templado entre noviembre y abril y un verano cálido y seco de mayo a octubre. El país es en gran parte desértico, solo en el estrecho cinturón cruzado por el río Nilo son posibles los cultivos.  '),
              const SizedBox(height: 10),
              const Text(
                  'Direccion: Están ubicadas cerca de El Cairo, las más alejadas a 60 kilómetros de la ciudad, y más bien al sur. Están todos en la orilla izquierda del Nilo, hacia el oeste. .'),
              const SizedBox(height: 15),
              const Text(
                  'Descripcion: Las pirámides de Egipto son, de todos los vestigios legados por los egipcios de la Antigüedad,'
                      ' los más portentosos y emblemáticos reconocidos. '),
              const SizedBox(height: 15),
              const Text(
                  'Construidas como criptas reales para los faraones a partir de 2630–2610 a. C.1​, con bloques de piedra revestidos de caliza, eran a la vista, grandes construcciones de color blanco.',
                  style: TextStyle(fontSize: 14)),
              const SizedBox(height: 15),
              const ListTile(
                leading: Icon(Icons.pin_drop, size: 30, color: Colors.black,),
                title: Text("Ubicacion", style: TextStyle( fontSize: 16)),
                textColor: Colors.black,
              ),
            ],
          ),
        ),
     ),
        bottomNavigationBar: const menuInferior(),
    )
  );
  }
}
