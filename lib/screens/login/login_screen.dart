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
    print("Login Screen BUILDED");
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
                  Padding(
                    padding: EdgeInsets.only(bottom: 100),
                    child: sigaaLogo(),
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
                    height: 64,
                  ),
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

  _hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
