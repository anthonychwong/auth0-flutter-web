@JS()
library auth0_spa_sdk;

import 'dart:html';

import 'package:js/js.dart';
import 'package:js/js_util.dart';

import 'options.dart';

@JS()
@anonymous
class _Promise<T>{} // just to denote a js promise object

@JS('createAuth0Client')
external _Promise<_Auth0JS> Function(Auth0ClientOptions) get _createAuth0Client;

Future<Auth0> createAuth0Client(Auth0ClientOptions options) {
  return promiseToFuture(_createAuth0Client(options))
  .then((auth0js) => Auth0._(auth0js));
}

@JS()
@anonymous // since it isn't exactly the auth0 object
abstract class _Auth0JS{
  @JS() external _Promise<void> loginWithPopup(PopupLoginOptions options, PopupConfigOptions config);
  @JS() external _Promise<void> loginWithRedirect(RedirectLoginOptions options);
  @JS() external void logout();
  @JS() external _Promise<String> getTokenWithPopup(GetTokenWithPopupOptions options, PopupConfigOptions config);
  @JS() external _Promise<Map<String, dynamic>> getUser(GetUserOptions options);
  @JS() external _Promise<Map<String, dynamic>> getIdTokenClaims(GetIdTokenClaimsOptions options);
}

class Auth0{
  final _Auth0JS _auth0js;

  Auth0._(this._auth0js);

  Future<void> loginWithPopup({PopupLoginOptions options = null, PopupConfigOptions config = null}) {
    return promiseToFuture(_auth0js.loginWithPopup(options ?? jsify({}), config ?? jsify({})));
  }

  Future<void> loginWithRedirect({RedirectLoginOptions options = null}) {
    return promiseToFuture(_auth0js.loginWithRedirect(options ?? jsify({})));
  }

  void logout() => _auth0js.logout();

  Future<String> getTokenWithPopup({GetTokenWithPopupOptions options, PopupConfigOptions config}){
    return promiseToFuture(_auth0js.getTokenWithPopup(options ?? jsify({}), config ?? jsify({})));
  }
  
  Future<Map<String, dynamic>> getUser({GetUserOptions options = null}) => promiseToFutureAsMap(_auth0js.getUser(options ?? jsify({})));
  Future<Map<String, dynamic>> getIdTokenClaims({GetIdTokenClaimsOptions options = null}) => promiseToFutureAsMap(_auth0js.getIdTokenClaims(options ?? jsify({})));
}
