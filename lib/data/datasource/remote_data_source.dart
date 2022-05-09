import 'package:finder/data/network/request/request.dart';
import 'package:finder/data/responses/responses.dart';

import '../network/api/app_api.dart';

abstract class RemoteDataSource{
 Future<BaseResponses> login(LoginRequest loginRequest);
}


class RemoteDataSourceImpl  implements RemoteDataSource{
 final AppServiceClient  _appServiceClient;
 RemoteDataSourceImpl(this._appServiceClient);
  @override
  Future<BaseResponses> login(LoginRequest loginRequest) async{
    return await _appServiceClient.login(loginRequest.nationalId, loginRequest.password);
  }
}