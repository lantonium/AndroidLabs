import 'package:flutter/material.dart';
import 'package:Androidlab/pages/register_page.dart';
import 'package:Androidlab/pages/menu_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  final _email = TextEditingController();
  final _password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  late mensaje msg;
  late Box box1;

  @override
  void initState(){
    super.initState();
    createBox();
    getData();
  }

  void createBox() async{
    box1 = await Hive.openBox('logindata');
  }
  void getData() async{
    if(box1.get('_email')!=null){
      _email.text = box1.get('_email');
      isChecked = true;
      setState(() {

      });
    }
    if(box1.get('_password')!=null){
      _password.text = box1.get('_password');
      isChecked = true;
      setState(() {

      });
    }
  }

  void login(){
    if(isChecked){
      box1.put('email', _email.text);
      box1.put('password', _password.text);
    }
  }

  void validarUsuario() async {
    mensaje(this.context);
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: _email.text, password: _password.text);
      if (user != null) {
        msg.mostrarMensaje("Bienvenido!!!!");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MenuPage()));
      }
    } on FirebaseAuthException catch (e) {
      //most-rarMensaje("${e.code}");

      if (e.code == "invalid-email") {
        msg.mostrarMensaje("El formato del Email no es correcto.");
      } else if (e.code == "user-not-found") {
        msg.mostrarMensaje("El usuario no esta registrado.");
      } else if (e.code == "wrong-password") {
        msg.mostrarMensaje("Contraseña Incorrecta.");
      } else if (e.code == "unknown") {
        msg.mostrarMensaje("Complete los datos por favor.");
      } else if (e.code == "network-request-failed") {
        msg.mostrarMensaje("Revise su conexion a internet.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //msg = mensaje(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Iniciar Sesion',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Icon(
                  Icons.login,
                  size: 90,
                ),
                const SizedBox(
                  height: 16.0,
                ),

                const SizedBox(
                  height: 16.0,
                ),

                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Correo Electronico'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'Contraseña'),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    login();
                    validarUsuario();
                  },
                  child: const Text('Iniciar sesion'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Recordarme",style: TextStyle(color: Colors.blueGrey),),
                    Checkbox(
                      value: isChecked,
                      onChanged: (value){
                        isChecked = !isChecked;
                        setState(() {

                        });
                      },
                    ),
                  ],
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrarPage()));
                    },
                    child: const Text('Registrarse')),
                // Text(
                //   _data,
                //   style: const TextStyle(
                //       fontSize: 12, fontStyle: FontStyle.italic),
                //)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class mensaje {
  late BuildContext context ;
  mensaje(this.context);
  void mostrarMensaje(String mensaje) {
    final pantalla = ScaffoldMessenger.of(context);
    pantalla.showSnackBar(SnackBar(
      content: Text(
        mensaje,
        style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.grey.withOpacity(0),
      duration: const Duration(seconds: 10),
      action: SnackBarAction(
          label: '',//'Registrese',
          onPressed: () {
            pantalla.hideCurrentSnackBar;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => register_page()));
          }),
    ));
  }

  void mensajeOk(String mensaje) {
    final pantalla = ScaffoldMessenger.of(context);
    pantalla.showSnackBar(SnackBar(
      content: Text(
        mensaje,
        style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      ),
        backgroundColor: Colors.grey.withOpacity(0),
      duration: const Duration(seconds: 10),
    ));
  }

  register_page() {}
}
