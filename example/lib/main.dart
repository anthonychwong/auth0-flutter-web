import 'package:flutter/material.dart';
import 'package:auth0_flutter_web/auth0_flutter_web.dart';

Auth0 auth0;

void main() async {
  auth0 = await createAuth0Client(
    Auth0CreateOptions(
      domain: '-- domain of the universal login page --',
      client_id: '-- id of your app --',
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
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _loggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _loggedIn ? 
              RaisedButton(child: Text('Logout'),onPressed: (){},):
              RaisedButton(child: Text('Login'),onPressed: () async {
                print(await auth0.getTokenWithPopup());
                // await auth0.loginWithPopup();
                setState(() => _loggedIn = true);
              },),
          ],
        ),
      ),
    );
  }
}
