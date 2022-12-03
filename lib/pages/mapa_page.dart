import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Androidlab/pages/menu_page.dart';

class MapaPage extends StatefulWidget {

  final datosPoi poi;

  MapaPage(this.poi);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {

  @override
  Widget build(BuildContext context) {

    final posicion = CameraPosition(
        target: LatLng(widget.poi.ubicacion.latitude, widget.poi.ubicacion.longitude),
        zoom: 15
    );

    final Set<Marker> marcador = Set();

    setState(() {
      marcador.add(
        Marker(markerId: MarkerId(widget.poi.id),
        position: LatLng(widget.poi.ubicacion.latitude, widget.poi.ubicacion.longitude),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindow: InfoWindow(
            title: widget.poi.nombre,
            snippet: widget.poi.contacto
          )
        )
      );
    });

    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.poi.nombre),
      ),
      drawer: MenuPage(),
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