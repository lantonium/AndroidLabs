import 'package:flutter/material.dart';
import 'package:Androidlab/pages/menu_page.dart';

class ColromanoPage extends StatefulWidget {
  const ColromanoPage({Key? key}) : super(key: key);

  @override
  _ColromanoPageState createState() => _ColromanoPageState();
}

class _ColromanoPageState extends State<ColromanoPage> {
  void initState() {
    //pasarPage();
    super.initState();
  }

/* Future<void> pasarPage() async {
    Future.delayed(const Duration(seconds: 8), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AndroidLab',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Detalle Sitio Turistico'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 15),
                const Text('Coliseo Romano',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),
                const Image(
                    image: AssetImage("assets/images/coliseo-de-roma.jpg")),
                const SizedBox(height: 15),
                const Text('Horario: 09:00 a 17:00 Horas',
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                const Text( 'Temperatura:'
                    'El clima romano es  suave y templado, '
                    '-excepto algunos días de canícula estiva- '
                    'por lo que cualquier '
                    'época del año es buena '
                    'para visitar la ciudad..  '),
                const SizedBox(height: 10),
                const Text('Direccion: El Coliseo se ubica en la '
                    'ciudad de Roma, Italia, hacia el Este del Foro '
                    'romano. Piazza del Colosseo, 1, 00184 Roma RM, Italia'),
                const SizedBox(height: 15),
                const Text('Descripcion: La construcción del Anfiteatro Flavio, más conocido como Coliseo Romano, empezó alrededor del año 71 d.C. '
                    'bajo el emperador Vespasiano '
                    'río Urubamba.'),
                const SizedBox(height: 15),
                const Text(
                    'El Coliseo de Roma es el mayor anfiteatro construido por los romanos a lo largo de la historia'
                    'De hecho, el eje mayor de la elipse total del Coliseo mide 187,8 metros. El eje menor mide 155,6 y '
                        'tiene, por tanto, una superficie total de 22.951 metros '
                        'cuadrados.',
                    style: TextStyle(fontSize: 14)),
                const SizedBox(height: 15),
                TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MenuPage()));
                    },
                    child: const Text('Regresar')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
