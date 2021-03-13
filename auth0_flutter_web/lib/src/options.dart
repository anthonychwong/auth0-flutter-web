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
class BaseLoginOptions {
  external String get display;
  external String get prompt;
  external Object get max_age;
  external String get ui_locales;
  external String get id_token_hint;
  external String get login_hint;
  external String get acr_values;
  external String get scope;
  external String get audience;
  external String get connection;

  external factory BaseLoginOptions({
    String display,
    String prompt,
    Object max_age,
    String ui_locales,
    String id_token_hint,
    String login_hint,
    String acr_values,
    String scope,
    String audience,
    String connection
  });
}

@JS()
@anonymous
class PopupLoginOptions extends BaseLoginOptions{
  external factory PopupLoginOptions({
    String display,
    String prompt,
    Object max_age,
    String ui_locales,
    String id_token_hint,
    String login_hint,
    String acr_values,
    String scope,
    String audience,
    String connection
  });
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

@JS()
@anonymous
class PopupConfigOptions {
  external int get timeoutInSeconds;
  external Object get popup;

  external factory PopupConfigOptions({int timeoutInSeconds, Object popup});
}
