class Usuario {
  var _id;
  var _nombres;
  var _email;
  var _password;

  Map<String, dynamic> convertir() => {
    'id': _id,
    'nombres': _nombres,
    'email': _email,
    'password': _password
  };

  Usuario(this._id, this._nombres, this._email, this._password);

  Usuario.fromJson(Map<String, dynamic> data)
  : _id= data['id'],
    _nombres= data['nombres'],
    _email= data['email'],
    _password= data['password'];


  get id => _id;

  set id(value) {
    _id = value;
  }

  get nombres => _nombres;

  set nombres(value) {
    _nombres = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }
}