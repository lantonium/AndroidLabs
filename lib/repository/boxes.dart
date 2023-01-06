import 'package:hive/hive.dart';
import 'package:androidlab/modelo/login_local.dart';

class Boxes{

  static Box<LoginLocal> box1() => Hive.box<LoginLocal>('recordarme');

  static boxFavoritos() {}
}