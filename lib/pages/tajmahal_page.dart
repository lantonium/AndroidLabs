import 'package:flutter/material.dart';
import 'package:androidlab/pages/menu_page.dart';


class TajmahalPage extends StatefulWidget {
  const TajmahalPage({Key? key}) : super(key: key);

  @override
  _TajmahalPageState createState() => _TajmahalPageState();
}

class _TajmahalPageState extends State<TajmahalPage> {
  void initState() {
    //pasarPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'androidlab',
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
              const Text('Taj-Mahal', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),
                    image: const DecorationImage (image: AssetImage("assets/images/taj-mahal.jpg"), fit: BoxFit.cover)
                ),
                width: double.infinity,
                height: 200,
              ) ,

              const SizedBox(height: 15),
              const Text('Horario: 09:00 a 16:00 Horas',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),
              const SizedBox(height: 10),
              const Text(
                  'Temperatura: El clima del Taj Mahal y Agra tiene tres estaciones distintas con solo una que es favorable para turistas y visitantes. Las tres estaciones son el invierno suave, el verano increíblemente caluroso y el monzón húmedo. La mejor temporada para visitar el Taj Mahal es'
                      'durante los meses de invierno de noviembre a febrero. '),
              const SizedBox(height: 10),
              const Text(
                  'Direccion: Taj Mahal se encuentra en la ciudad india de Agra aproximadamente '
                      'a 200 km al sur de Delhi, la capital de la India..'),
              const SizedBox(height: 15),
              const Text(
                  'Descripcion: es un monumento funerario construido entre 1632 y 1648 en la ciudad de Agra, estado de Uttar Pradesh (India), a orillas del río Yamuna, por el emperador musulmán Shah Jahan de la dinastía mogol. El imponente conjunto de edificios se erigió en honor de su esposa favorita, Arjumand Banu Begum —más conocida como Mumtaz Mahal— que '
                      'murió en el parto de su decimocuarto hijo'),
              const SizedBox(height: 15),
              const Text(
                  'Se estima que en su construcción trabajaron unos 20 000 obreros bajo dirección de un conjunto de arquitectos liderados por el arquitecto de la corte, Ustad Ahmad Lahori.'
                  '',
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
    ),
    );
  }
}
