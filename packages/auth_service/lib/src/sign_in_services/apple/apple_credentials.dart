part of auth;

class AppleCredentials {
  const AppleCredentials();

  Future<AuthorizationCredentialAppleID?> getAppleCredentials({
    required List<AppleIDAuthorizationScopes> scopes,
    required String? token,
  }) async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: scopes,
        nonce: token,
      );

      return credential;
    } on Exception {
      throw Exception('ERROR_APPLE_ID_CREDENTIAL');
    }
  }
}
