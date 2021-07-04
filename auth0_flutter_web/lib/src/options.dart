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
  external String? get connection;

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
    String? connection
  });
}

@JS()
@anonymous
class AdvancedOptions {
  external String? get defaultScope;

  external factory AdvancedOptions({
    String? defaultScope
  });
}

@JS()
@anonymous
class Auth0ClientOptions extends BaseLoginOptions {
  external String get domain;
  external String get issuer;
  external String get client_id;
  external String get redirect_url;
  external num get leeway;
  external Object get cacheLocation;
  external bool get useRefreshTokens;
  external num get authorizeTimeoutInSeconds;
  external bool get legacySameSiteCookie;
  external bool get useCookiesForTransactions;
  external AdvancedOptions get advancedOptions;
  external num get sessionCheckExpiryDays;
  
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
    String? connection,
    @required String domain,
    String issuer,
    @required String client_id,
    String redirect_url,
    num leeway,
    Object cacheLocation,
    bool useRefreshTokens,
    num authorizeTimeoutInSeconds,
    bool legacySameSiteCookie,
    bool useCookiesForTransactions,
    AdvancedOptions advancedOptions,
    num sessionCheckExpiryDays
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
    String? connection
  });
}

@JS()
@anonymous
class GetTokenWithPopupOptions extends PopupLoginOptions {
  external factory GetTokenWithPopupOptions({
    String display,
    String prompt,
    Object max_age,
    String ui_locales,
    String id_token_hint,
    String login_hint,
    String acr_values,
    String scope,
    String audience,
    String? connection
  });
}

@JS()
@anonymous
class GetTokenSilentlyOptions {
  external String get audience;
  external bool get ignoreCache;
  external String get redirect_uri;
  external String get scope;
  external num get timeoutInSeconds;

  external factory GetTokenSilentlyOptions({
    String audience,
    bool ignoreCache,
    String redirect_uri,
    String scope,
    num timeoutInSeconds,
  });
}

@JS()
@anonymous
class LogoutOptions {
  external String get returnTo;
  external String? get client_id;
  external bool get federated;
  external bool get localOnly;

  external factory LogoutOptions({
    String returnTo,
    String? client_id,
    bool federated,
    bool localOnly,
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
  external num get timeoutInSeconds;
  external Object get popup;

  external factory PopupConfigOptions({num timeoutInSeconds, Object popup});
}
