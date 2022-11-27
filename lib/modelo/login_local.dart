import 'package:hive/hive.dart';

part 'login_local.g.dart';

@HiveType(typeId: 0)
class LoginLocal extends HiveObject{

  @HiveField(0)
  String? email;
  @HiveField(1)
  String? contrasena;
}