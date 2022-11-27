import 'package:flutter/material.dart';
import 'package:Androidlab/pages/menu_page.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
          title: const Text('About'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 15),
                const Text('AndroidLab',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage (image: AssetImage("assets/images/logo.png"), fit: BoxFit.contain)
                ),
                width: double.infinity,
                height: 150,
              ) ,

      //          // ) ,

                const SizedBox(height: 25),
                const Text('Developers',
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),
                const SizedBox(height: 25),
                const Icon(
                  Icons.flutter_dash, size: 30, color: Colors.black,),
                const Text( 'Luis Antonio Gonzalez',
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 15)),
                const SizedBox(height: 15),
                const Icon(
                  Icons.flutter_dash, size: 30, color: Colors.black,),
                const Text( 'John Alexander Restrepo',
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 15)),

                const SizedBox(height: 15),
                const Text('Version 1.0',
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 15)),

                const SizedBox(height: 15),
                const Text('droidlabs2022@gmail.com',
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 15)),
                const SizedBox(height: 15),
                const Text('All rights reserved ©',
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 15)),
                const SizedBox(height: 15),
                const Text('2022',
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 15)),

                TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MenuPage()));
                    },
                    child: const Text('Terminos y condiciones')),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const menuInferior(),
      ),
    );
  }
}
