part of auth;

typedef BuildSignInService = ISignInService? Function();

class SignInServiceFactory {
  SignInServiceFactory();

  final _signInServiceInstances = <SocialMediaMethod, ISignInService?>{};
  final _signInServiceConstructor = <SocialMediaMethod, BuildSignInService>{};
  ISignInService? _signInMethod;

  ISignInService? get signInMethod => _signInMethod;

  ISignInService? getService({required SocialMediaMethod method}) {
    if (!_signInServiceInstances.containsKey(method)) {
      _signInServiceInstances[method] = _signInServiceConstructor[method]!();
    }

    _signInMethod = _signInServiceInstances[method];

    return _signInMethod;
  }

  void addService({
    required SocialMediaMethod method,
    required BuildSignInService constructor,
  }) {
    if (!_signInServiceConstructor.containsKey(method)) {
      _signInServiceConstructor[method] = constructor;
    } else {
      throw Exception('Error: The method already exists.');
    }
  }
}
