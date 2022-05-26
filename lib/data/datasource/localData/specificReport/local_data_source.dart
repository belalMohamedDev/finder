import 'package:finder/data/network/error_handler/error_handler.dart';
import 'package:finder/data/responses/MakeSpecificReport/response.dart';




const cacheHomeKey="cacheHomeKey";
const cacheHomeInterval=60*1000;  // 1 minute cache in millis
abstract class SpecificReportLocalDataSource{
  Future<MakeSpecificReportResponse> getSpecificReports();

  Future<void> saveReportToCache(MakeSpecificReportResponse reportResponse);

  void clearCache();
  void removeFromCache(String key);

}


class SpecificReportLocalDataSourceImpl implements SpecificReportLocalDataSource {
  //run time cache
  Map<String,CachedItem> cashMap={};
  @override
  Future<MakeSpecificReportResponse> getSpecificReports() async{
    CachedItem? cachedItem=cashMap[cacheHomeKey];
    if(cachedItem !=null&&cachedItem.isValid(cacheHomeInterval)){
      //return the response from cash
      return cachedItem.data;

    }else{
      // return an error that cash is not there or its not valid
      throw ErrorHandler.handle(DataSource.cacheError);
    }
  }

  @override
  Future<void> saveReportToCache(MakeSpecificReportResponse reportResponse) async{
    cashMap[cacheHomeKey]=CachedItem(reportResponse);
  }

  @override
  void clearCache() {
    cashMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cashMap.remove(key);
  }
}


class CachedItem{
  dynamic data;
  int cacheTime=DateTime.now().millisecondsSinceEpoch;
  CachedItem(this.data);
}



extension CachedItemExtension on CachedItem{
  bool isValid(int expirationTimeInMillis){
    int currentTimeInMillis=DateTime.now().millisecondsSinceEpoch;
    bool isValid=currentTimeInMillis-cacheTime<=expirationTimeInMillis;
    return isValid;
  }
}