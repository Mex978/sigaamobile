import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sigaamobile/controllers/user_controller.dart';
import 'package:sigaamobile/shared/components/custom_exception.dart';

import 'index.dart';

class LoginScreen extends StatefulWidget {
  final String title;
  const LoginScreen({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _userController = GetIt.I.get<UserController>();
  FocusNode _userFocusNode = FocusNode();
  FocusNode _passFocusNode = FocusNode();
  ReactionDisposer _listener;
  String _user;
  String _pass;

  @override
  void initState() {
    _listener = autorun((_) {
      switch (_userController.stateLogin) {
        case RequestState.SUCCESS:
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomeScreen()));
          break;
        case RequestState.ERROR:
          showErroDialog(
              context: context,
              content:
                  "Algum erro ocorreu durante o login, verifique se o sigaa está disponível ou se você já fez a avaliação institucional.");
          break;
        default:
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _listener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GestureDetector(
        onTap: () => _hideKeyboard(),
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    sigaaLogo(),
                    _divider(100),
                    _input(
                        onChanged: (content) {
                          setState(() {
                            _user = content;
                          });
                        },
                        label: "Usuário"),
                    _divider(16),
                    _input(
                        onChanged: (content) {
                          setState(() {
                            _pass = content;
                          });
                        },
                        label: "Senha",
                        isPassword: true),
                    _divider(64),
                    Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Observer(
                          builder: (_) {
                            switch (_userController.stateLogin) {
                              case RequestState.LOADING:
                                return CircularProgressIndicator();
                              case RequestState.SUCCESS:
                                return _buttonLogin();
                              default:
                                return _buttonLogin();
                            }
                          },
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }

  _input(
      {ValueChanged<String> onChanged,
      @required String label,
      bool isPassword: false}) {
    return TextFormField(
      onChanged: (content) => onChanged(content),
      obscureText: isPassword,
      focusNode: label == "Usuário" ? _userFocusNode : _passFocusNode,
      decoration: InputDecoration(
          labelText: label,
          hintText: label == "Usuário"
              ? "Digite o seu ${label.toLowerCase()}"
              : "Digite sua ${label.toLowerCase()}"),
      validator: (content) {
        if (content.isEmpty) {
          return "Insira ${label == "Usuário" ? "seu usuário" : "sua senha"}";
        } else {
          return null;
        }
      },
      onFieldSubmitted: (_) {
        if (label == "Usuário") {
          FocusScope.of(context).requestFocus(_passFocusNode);
        } else {
          _fazerLogin();
        }
      },
    );
  }

  _buttonLogin() {
    return RaisedButton(
      child: Text(
        "Entrar",
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).textTheme.button.color),
      ),
      onPressed: () {
        _fazerLogin();
      },
    );
  }

  _divider(double height) {
    return Divider(
      color: Colors.transparent,
      height: height,
    );
  }

  _hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  _fazerLogin() {
    if (_formKey.currentState.validate()) {
      FocusScope.of(context).requestFocus(FocusNode());
      _userController.login(userTemp: _user, passTemp: _pass);
    }
  }
}
