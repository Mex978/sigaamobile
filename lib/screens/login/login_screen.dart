import 'index.dart';

class LoginScreen extends StatefulWidget {
  final String title;
  const LoginScreen({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc;
  String _user;
  String _pass;

  @override
  void initState() {
    _loginBloc = BlocProvider.getBloc<LoginBloc>();
    _listener();
    super.initState();
  }

  _listener() {
    _loginBloc.outState.listen((state) {
      print(state);
      if (state == RequestState.SUCCESS) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GestureDetector(
        onTap: () => _hideKeyboard(),
        child: Center(
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
                      child: StreamBuilder<RequestState>(
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
                      )),
                ],
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
    return TextField(
      onChanged: (content) => onChanged(content),
      obscureText: isPassword,
      decoration: InputDecoration(
          labelText: label,
          hintText:
              label == "Usuário" ? "Digite o seu $label" : "Digite sua $label"),
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
        _loginBloc.login(_user, _pass);
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
}
