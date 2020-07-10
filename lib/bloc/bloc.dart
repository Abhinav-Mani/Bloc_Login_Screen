import 'dart:async';
import 'validator.dart';

class Bloc extends Object with Validator{
  final _email=StreamController<String>();
  final _password=StreamController<String>();
  
  Stream<String> get email=>_email.stream.transform(ValidatEmail);
  Stream<String> get password=>_password.stream.transform(ValidatorPassword);

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  dispose(){
    _email.close();
    _password.close();
  }
}

final bloc = Bloc();