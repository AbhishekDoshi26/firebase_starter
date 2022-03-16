import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  Future<bool> getCreateAccountData() async {
    FirebaseRemoteConfig.instance.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 0),
      ),
    );
    await FirebaseRemoteConfig.instance.fetchAndActivate();
    await FirebaseRemoteConfig.instance.ensureInitialized();

    bool _value = FirebaseRemoteConfig.instance.getBool('create_account');
    print(_value);
    return _value;
  }
}
