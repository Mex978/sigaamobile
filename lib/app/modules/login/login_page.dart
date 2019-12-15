import 'package:flutter/material.dart';
import 'package:sigaamobile/app/app_module.dart';
import 'package:sigaamobile/app/consts.dart';
import 'package:sigaamobile/app/modules/home/home_module.dart';
import 'package:sigaamobile/app/modules/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc;
  String _user;
  String _pass;

  @override
  void initState() {
    _loginBloc = AppModule.to.getBloc<LoginBloc>();
    _listener();
    super.initState();
  }

  _listener() {
    _loginBloc.outState.listen((state) {
      if (state == RequestState.SUCCESS) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeModule()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Divider(
                color: Colors.transparent,
                height: 64,
              ),
              Text("Sigaa Mobile"),
              Divider(
                color: Colors.transparent,
                height: 32,
              ),
              TextField(
                onChanged: (content) {
                  setState(() {
                    _user = content;
                  });
                },
                decoration: InputDecoration(labelText: "Usuário"),
              ),
              Divider(
                color: Colors.transparent,
                height: 16,
              ),
              TextField(
                onChanged: (content) {
                  setState(() {
                    _pass = content;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(labelText: "Senha"),
              ),
              Divider(
                color: Colors.transparent,
                height: 32,
              ),
              StreamBuilder<RequestState>(
                stream: _loginBloc.outState,
                builder: ((context, snapshot) {
                  switch (snapshot.data) {
                    case RequestState.LOADING:
                      return CircularProgressIndicator();
                    case RequestState.SUCCESS:
                      return _buttonLogin();
                    default:
                      return _buttonLogin();
                  }
                }),
              ),
              Divider(
                color: Colors.transparent,
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buttonLogin() {
    return RaisedButton(
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(64)),
      child: Text(
        "Entrar",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
      onPressed: () {
        _loginBloc.login(_user, _pass);
      },
    );
  }
}
