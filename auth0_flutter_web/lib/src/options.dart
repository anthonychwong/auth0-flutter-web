@JS()
library auth0_spa_sdk_options;

import 'package:js/js.dart';
import 'package:meta/meta.dart';

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
class AdvancedOptions {
  external String get defaultScope;

  external factory AdvancedOptions({
    String defaultScope
  });
}

@JS()
@anonymous
class Auth0ClientOptions extends BaseLoginOptions {
  external String get domain;
  external String get issuer;
  external String get client_id;
  external String get redirect_url;
  external double get leeway;
  external Object get cacheLocation;
  external bool get useRefreshTokens;
  external double get authorizeTimeoutInSeconds;
  external bool get legacySameSiteCookie;
  external bool get useCookiesForTransactions;
  external AdvancedOptions get advancedOptions;
  external double get sessionCheckExpiryDays;
  
  external factory Auth0ClientOptions({
    String display,
    String prompt,
    Object max_age,
    String ui_locales,
    String id_token_hint,
    String login_hint,
    String acr_values,
    String scope,
    String audience,
    String connection,
    @required String domain,
    String issuer,
    @required String client_id,
    String redirect_url,
    double leeway,
    Object cacheLocation,
    bool useRefreshTokens,
    double authorizeTimeoutInSeconds,
    bool legacySameSiteCookie,
    bool useCookiesForTransactions,
    AdvancedOptions advancedOptions,
    double sessionCheckExpiryDays
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
