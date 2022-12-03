import 'package:Androidlab/repository/boxes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'menu_page.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({Key? key}) : super(key: key);

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {
  //final correo=FirebaseAuth.instance.currentUser?.email.toString();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String? correo=FirebaseAuth.instance.currentUser?.email.toString();
    print("----------------------->>>>>>>>>>>>>>>< "+correo!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
      ),
      drawer: MenuPage(),
      body:const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        //child: ListaFavoritos(),
      ),
      bottomNavigationBar: const menuInferior(),
    );
  }

  Widget ListaFavoritos(){

    return ValueListenableBuilder<Box<poiesLocal>>(
        valueListenable: Boxes.boxFavoritos().listenable(),
        builder: (context, box, _){
          final lista = box.values.toList().cast<poiesLocal>();
          return ListView.builder(
              padding: EdgeInsets.all(30),
              itemCount: lista.length,
              itemBuilder: (BuildContext context, i){
                return Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(lista[i].foto ?? ""),
                          radius: 50,
                        )
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(lista[i].nombre ?? "", style: const TextStyle(fontSize: 20, color: Colors.black, )),
                        subtitle: Text(lista[i].ciudad ?? ""),
                        onTap: (){
                          //datospoi poiNew= datospoi(lista[i].id ?? "", lista[i].nombre ?? "", lista[i].ciudad ?? "", lista[i].contacto ?? "", lista[i].foto ?? "", lista[i].perfil ?? "");
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>Detallepoi(poiNew)));
                        },
                        onLongPress: (){
                          setState(() {
                            lista[i].delete();
                          });
                        },
                      ),
                    ),
                  ],
                );
              }
          );
        });
  }
}

class poiesLocal {
  get foto => null;
  get nombre => null;
  get ciudad => null;
  void delete() {}

}
