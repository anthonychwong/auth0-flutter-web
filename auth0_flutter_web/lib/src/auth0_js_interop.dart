@JS()
library auth0_spa_sdk;

import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS()
@anonymous
class _Promise<T>{} // just to denote a js promise object

@JS()
@anonymous
class Auth0CreateOptions{
  external String get domain;
  external String get client_id;
  external bool get useRefreshTokens;

  external factory Auth0CreateOptions({String domain, String client_id, bool useRefreshTokens = false});
}

@JS('createAuth0Client')
external _Promise<_Auth0JS> Function(Auth0CreateOptions) get _createAuth0Client;

Future<Auth0> createAuth0Client(Auth0CreateOptions options) {
  return promiseToFuture(_createAuth0Client(options))
  .then((auth0js) => Auth0._(auth0js));
}

@JS()
@anonymous // since it isn't exactly the auth0 object
abstract class _Auth0JS{
  @JS()
  external _Promise<String> Function() get getTokenWithPopup;
}

class Auth0{
  final _Auth0JS _auth0js;

  Auth0._(this._auth0js);

  Future<String> getTokenWithPopup() => promiseToFuture(_auth0js.getTokenWithPopup());
}
