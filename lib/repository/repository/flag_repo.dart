import 'package:flag_with_provider/model/flag_model.dart';
import 'package:flag_with_provider/service/flag_service.dart';

class FlagRepository{

  FlagService _flagService=FlagService();

  Future<dynamic>FlagRepo()async{
    final response=await _flagService.getFlagNetwork("https://countriesnow.space/api/v0.1/countries/flag/images");
    return FlagModel.fromJson(response);
  }
}