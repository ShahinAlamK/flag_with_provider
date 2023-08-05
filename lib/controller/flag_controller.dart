import 'package:flag_with_provider/model/flag_model.dart';
import 'package:flag_with_provider/repository/repository/flag_repo.dart';
import 'package:flag_with_provider/repository/res/response.dart';
import 'package:flutter/material.dart';

class FlagController extends ChangeNotifier {

  FlagRepository _flagRepository=FlagRepository();

  ApiResponse<FlagModel> flagList=ApiResponse.Loading();
  setResponse(ApiResponse<FlagModel> _value){
    flagList=_value;
    notifyListeners();
  }

  void FetchFlag(){
    setResponse(ApiResponse.Loading());
    _flagRepository.FlagRepo().then((value){
      setResponse(ApiResponse.Complete(value));
    }).onError((error, stackTrace) {
      setResponse(ApiResponse.Error(error.toString()));
    });
    notifyListeners();
  }

  List<Data> searchList=[];
  queryFlag(String query){
   return flagList.data!.data!.where((e) =>e.name!.toLowerCase().contains(query.toLowerCase())).toList();
  }
  
}