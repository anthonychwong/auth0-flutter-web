# Auth0 Flutter Web

A wrapper for Auth0 SPA SDK to use Auth0 in Flutter Web.

> ⚠ The latest is [`0.0.1-alpha.3`](https://pub.dev/packages/auth0_flutter_web/versions/0.0.1-alpha.3) but not serve by `pub.dev` by default.

[![](https://img.shields.io/pub/v/auth0_flutter_web)](https://pub.dev/packages/auth0_flutter_web)

## How to use

### 1. Add dependency

  ```yaml
  dependencies:
    auth0_flutter_web:
  ```

### 2. Load Auth0 SPA SDK in `index.html`
   
   Make Auth0 SPA SDK available for dart by adding it to `index.html` in `web` folder (besides `ios` and `android`)

  ```HTML
  <head>
    <!-- other elements in head -->
    <script src="https://cdn.auth0.com/js/auth0-spa-js/1.13/auth0-spa-js.production.js"></script>
    <!-- other elements in head -->
  </head>
  ```

### 3. Use `Auth0` in dart code

  ```dart
  import 'package:auth0_flutter_web/auth0_flutter_web.dart';

  Auth0 auth0 = await createAuth0Client(
    Auth0CreateOptions(
      domain: '-- domain of the universal login page --',
      client_id: '-- id of your app --',
    )
  );

  String token = await auth0.getTokenWithPopup();
  ```

## Example

Complete source code of working example can be found in `example` folder under repository `root`
