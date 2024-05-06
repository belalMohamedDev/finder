import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected;
}


class NetworkInfoImpl implements NetworkInfo{
  NetworkInfoImpl(this._internetConnectionChecker);
  final InternetConnectionChecker _internetConnectionChecker;

  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;

}
