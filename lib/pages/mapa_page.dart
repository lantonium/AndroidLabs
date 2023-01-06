// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:androidlab/pages/menu_page.dart';

class MapaPage extends StatefulWidget {
  final datosPoi poi;

  const MapaPage(this.poi, {super.key});

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class datosPoi {
  var ubicacion;
  datosPoi({
    required this.ubicacion,
  });

  get id => null;
  get nombre => null;
  get contacto => null;

  @override
  String toString() => 'datosPoi(ubicacion: $ubicacion)';
}

class _MapaPageState extends State<MapaPage> {
  @override
  Widget build(BuildContext context) {
    final posicion = CameraPosition(
        target: LatLng(
            widget.poi.ubicacion.latitude, widget.poi.ubicacion.longitude),
        zoom: 15);

    final Set<Marker> marcador = {};

    setState(() {
      marcador.add(Marker(
          markerId: MarkerId(widget.poi.id),
          position: LatLng(
              widget.poi.ubicacion.latitude, widget.poi.ubicacion.longitude),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindow: InfoWindow(
              title: widget.poi.nombre, snippet: widget.poi.contacto)));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.poi.nombre),
      ),
      drawer: const MenuPage(),
      body: GoogleMap(
        initialCameraPosition: posicion,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: false,
        zoomControlsEnabled: true,
        mapType: MapType.normal,
        markers: marcador,
      ),
      bottomNavigationBar: const menuInferior(),
    );
  }
}
