@JS()
library auth0_spa_sdk_options;

import 'package:js/js.dart';

@JS()
@anonymous
class Auth0CreateOptions {
  external String get domain;
  external String get client_id;
  external bool get useRefreshTokens;

  external factory Auth0CreateOptions({String domain, String client_id, bool useRefreshTokens = false});
}

@JS()
@anonymous
class GetUserOptions{
  external String get scope;
  external String get audience;

  external factory GetUserOptions({String scope, String audience});
}

@JS()
@anonymous
class GetIdTokenClaimsOptions {
  external String get scope;
  external String get audience;

  external factory GetIdTokenClaimsOptions({String scope, String audience});
}
