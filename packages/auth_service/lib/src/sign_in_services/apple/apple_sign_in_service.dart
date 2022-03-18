part of auth;

class AppleSignInService implements ISignInService {
  AppleSignInService({required AppleCredentials appleCredentials})
      : _appleCredentials = appleCredentials;

  static const _charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  static const _authProvider = 'apple.com';

  final AppleCredentials _appleCredentials;

  /// Generates a random token
  String _generateRawRandomToken([int length = 32]) {
    final random = Random.secure();

    return List.generate(
      length,
      (_) => _charset[random.nextInt(_charset.length)],
    ).join();
  }

  /// Encrypts the token
  String _rawTokenToSha256({required String rawToken}) {
    final bytes = utf8.encode(rawToken);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Creates a Firebase credential
  auth.OAuthCredential _createCredential({
    required idToken,
    required rawToken,
  }) {
    return auth.OAuthProvider(_authProvider).credential(
      idToken: idToken,
      rawNonce: rawToken,
    );
  }

  @override
  Future<auth.OAuthCredential> getFirebaseCredential() async {
    final rawToken = _generateRawRandomToken();
    final token = _rawTokenToSha256(rawToken: rawToken);

    try {
      final appleCredential = await _appleCredentials.getAppleCredentials(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        token: token,
      );

      return _createCredential(
        idToken: appleCredential!.identityToken,
        rawToken: rawToken,
      );
    } on Exception {
      throw auth.FirebaseAuthException(code: 'ERROR_APPLE_LOGIN');
    }
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 1));
  }
}
