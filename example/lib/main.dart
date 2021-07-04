import 'package:flutter/material.dart';
import 'package:auth0_flutter_web/auth0_flutter_web.dart';

late Auth0 auth0;

void main() async {
  auth0 = await createAuth0Client(
    Auth0ClientOptions(
    )
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Auth0 Flutter Wrapper Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _loggedIn = false;
  String? _name = "";
  String? _avatarUrl = "";

  @override
  void initState() {
    super.initState();

    auth0.isAuthenticated()
      .then(_onAuthenticationChanged);
  }

  void _onAuthenticationChanged(bool isAuthenticated){
    if(!isAuthenticated){
      setState(() => _loggedIn = false);
    } else {
      auth0.getUser()
        .then((Map<String, dynamic>? user) => setState((){
            _loggedIn = true;
            _name = user!["name"];
            _avatarUrl = user["picture"];
          })); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _loggedIn ? 
              Column(
                children:[
                  Image.network(_avatarUrl!),
                  Text(_name!),
                  RaisedButton(
                    child: Text('Logout'),
                    onPressed: () async {
                      auth0.logout();

                      auth0.isAuthenticated()
                        .then((value) => setState(() => _loggedIn = value));
                    },)
                ]
              ):
              RaisedButton(child: Text('Login'),onPressed: () async {
                await auth0.loginWithPopup(options: PopupLoginOptions(scope: "email"));
                _onAuthenticationChanged(await auth0.isAuthenticated());
              },),
          ],
        ),
      ),
    );
  }
}
