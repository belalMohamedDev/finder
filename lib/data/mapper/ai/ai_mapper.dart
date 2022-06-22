import 'package:finder/application/constant.dart';
import 'package:finder/application/extensions.dart';

import '../../../domain/models/aiModel/ai_model.dart';
import '../../responses/ai/ai_response.dart';

extension AiResponsesMapper on AiResponse?{
  AiModel toDomain(){
    return AiModel(
        result : this?.result.orEmpty()?? Constant.empty,
      statusCode:  this?.statusCode .orZero()?? Constant.zero,

       );
  }
}