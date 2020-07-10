import 'dart:async';

class Validator{
  final ValidatEmail = StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink){
      if(email.contains('@')){
        sink.add(email);
      }else{
        sink.addError('Enter a valid email');
      }
    }
  );

  final ValidatorPassword = StreamTransformer<String,String>.fromHandlers(
    handleData: (password,sink){
      if(password.length>3){
        sink.add(password);
      }else{
        sink.addError('Enter a valid Password');
      }
    }
  );
}