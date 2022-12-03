import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Androidlab/pages/login_page.dart';
import 'package:Androidlab/pages/machu_picchu.dart';
import 'package:Androidlab/pages/tajmahal_page.dart';
import 'package:Androidlab/pages/colromano_page.dart';
import 'package:Androidlab/pages/piramegipto_page.dart';
import 'package:Androidlab/pages/favoritos_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'about_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});


  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final correo=FirebaseAuth.instance.currentUser?.email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String? correo=FirebaseAuth.instance.currentUser?.email.toString();
    print("----------------------->>>>>>>>>>>>>>>< correo!"); // se corrige error del boton regreso
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.blue
              ),
              child: Icon(Icons.account_circle_outlined, size: 120, color: Colors.white,)
          ),
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.mail_lock_outlined, size: 30, color: Colors.black,),
                title: Text((correo).toString(), style: const TextStyle( fontSize: 16)),
                textColor: Colors.black,
              ),
              ListTile(
                leading: const Icon(
                  Icons.pin_drop, size: 30, color: Colors.black,),
                title: const Text("Machu Picchu", style: TextStyle( fontSize: 20)),
                textColor: Colors.indigo,
                onTap: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const PoiPage()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.pin_drop, size: 30, color: Colors.black,),
                title: const Text("Taj-Mahal", style: TextStyle( fontSize: 20)),
                textColor: Colors.indigo,
                onTap: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const TajmahalPage()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.pin_drop, size: 30, color: Colors.black,),
                title: const Text("Coliseo Romano", style: TextStyle( fontSize: 20)),
                textColor: Colors.indigo,
                onTap: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const ColromanoPage()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.pin_drop, size: 30, color: Colors.black,),
                title: const Text("Piramides de Egipto", style: TextStyle( fontSize: 20)),
                textColor: Colors.indigo,
                onTap: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const PiramegiptoPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app, size: 20, color: Colors.black,),
                title: const Text("Salir", style: TextStyle( fontSize: 20)),
                textColor: Colors.black,
                onTap: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage()));

                },
              ),

              ListTile(
                leading: const Icon(Icons.abc, size: 20, color: Colors.black,),
                title: const Text("About", style: TextStyle( fontSize: 20)),
                textColor: Colors.black,
                onTap: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const AboutPage()));

                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class menuInferior extends StatelessWidget {
  const menuInferior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.black54,
      unselectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.houseChimney,size: 25),label: ""
        ),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.star,size: 25),label: ""
        ),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.info,size: 25),label: ""
        )
      ],
      onTap: (indice){
        if(indice==0){
          Navigator.push(context, MaterialPageRoute(builder: (contetx)=> const MenuPage()));
        }else if(indice==1){
          Navigator.push(context, MaterialPageRoute(builder: (contetx)=> const FavoritosPage()));
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (contetx)=> const AboutPage()));
        }
      },

    );
  }
}