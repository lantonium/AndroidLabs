import 'package:flutter/material.dart';
import 'package:androidlab/modelo/usuario_modelo.dart';
import 'package:androidlab/pages/login_page.dart';
import 'package:androidlab/repository/register_user.dart';
//import 'dart:convert';

class RegistrarPage extends StatefulWidget {
  const RegistrarPage({Key? key}) : super(key: key);

  @override
  _RegistrarPageState createState() => _RegistrarPageState();
}

class _RegistrarPageState extends State<RegistrarPage> {

  final nombres=TextEditingController();
  final email=TextEditingController();
  final password=TextEditingController();
  final passwordConf=TextEditingController();
  Usuario_Registrar usuario= Usuario_Registrar();
  late mensaje msg;

  void guardarUsuario(Usuario usuNew) async {
    var resultado= await usuario.registrarUsuario(email.text, password.text);

    if(resultado=="invalid-email"){
      msg.mostrarMensaje("El formato del Email no es correcto.");
    }else
    if(resultado=="weak-password"){
      msg.mostrarMensaje("La contraseña debe tener minimo 6 caracteres.");
    }else
    if(resultado=="unknown"){
      msg.mostrarMensaje("Complete los datos.");
    }else
    if(resultado=="network-request-failed"){
      msg.mostrarMensaje("Revise su conexión a internet.");
    }else{
      usuNew.id=resultado;
      registrarUsuario(usuNew);
      msg.mensajeOk("Usuario Registrado exitosamente, Inicie sesion.");
    }
  }

  void registrarUsuario(Usuario usuNew) async{
    var id= await usuario.crearUsuario(usuNew);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
  }

  void traerDatos(){

    setState(() {
      if(password.text == passwordConf.text){
        if(nombres.text.isNotEmpty && email.text.isNotEmpty && password.text.isNotEmpty && passwordConf.text.isNotEmpty){
          var usuNew= Usuario("",nombres.text, email.text, password.text);
          guardarUsuario(usuNew);
        }else{
          msg.mostrarMensaje("Datos Incompletos.");
        }
      }else{
        msg.mostrarMensaje("Las contraseñas no coinciden.");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    msg = mensaje(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Registrarse',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Icon(
                  Icons.app_registration,size: 90,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: nombres,
                  decoration: const InputDecoration (
                      border: UnderlineInputBorder(),
                      labelText: 'Nombre'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Correo Electronico'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: password,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'Contraseña'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: passwordConf,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Repita constraseña'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      //_onRegisterButtonClicked();
                      traerDatos();
                    },
                    child: const Text('Registro')),

                TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
                    },
                    child: const Text('Regresar')),
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