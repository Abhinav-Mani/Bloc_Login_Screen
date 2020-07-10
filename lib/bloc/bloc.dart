import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validator{
  final _email=BehaviorSubject<String>();
  final _password=BehaviorSubject<String>();
  
  Stream<String> get email=>_email.stream.transform(ValidatEmail);
  Stream<String> get password=>_password.stream.transform(ValidatorPassword);
  Stream<bool> get submitValid=>CombineLatestStream.combine2(email, password, (e,p) => true);

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit(){
    print(_email.value+" "+_password.value);
  }

  dispose(){
    _email.close();
    _password.close();
  }
}