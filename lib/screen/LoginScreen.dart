import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bloc/bloc.dart';
import '../bloc/Provider.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(margin:EdgeInsets.only(top:25.0) ),
          submitButton(bloc),
        ],
      ),
    );
  }
  Widget emailField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.email,
      builder: (context,snapshot){
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            errorText: snapshot.error,
            hintText: 'you@example.com',
            labelText: 'Email Address',
          ),
        );
      },
    );
  }
  Widget passwordField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.password,
      builder: (context,snapshot){
        return TextField(
          obscureText: true,
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
              errorText: snapshot.error,
              hintText: 'password',
              labelText: 'Password'
          ),
        );
      },
    );
  }
  Widget submitButton(Bloc bloc){
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context,snapshot){
        return RaisedButton(
          child: Text('login'),
          color: Colors.blue,
          onPressed: snapshot.hasData? bloc.submit:null,
        );
      },
    );
  }
}