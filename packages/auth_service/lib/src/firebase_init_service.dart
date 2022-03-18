part of auth;

class FirebaseInitService {
  final Map<SocialMediaMethod, ISignInService> _services = {
    SocialMediaMethod.apple: AppleSignInService(
      appleCredentials: const AppleCredentials(),
    ),
    SocialMediaMethod.facebook: FacebookSignInService(
      facebookAuth: FacebookAuth.instance,
    ),
    SocialMediaMethod.google: GoogleSignInService(
      googleSignIn: GoogleSignIn(),
    ),
  };

  FirebaseAuthService init(List<SocialMediaMethod> socialMediasAuth) {
    final _serviceFactory = SignInServiceFactory();

    for (var element in socialMediasAuth) {
      if (_services.containsKey(element)) {
        _serviceFactory.addService(
          method: element,
          constructor: () => _services[element],
        );
      }
    }

    return FirebaseAuthService(
      authService: FirebaseAuth.instance,
      signInServiceFactory: _serviceFactory,
    );
  }
}
