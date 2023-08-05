import 'status.dart';

class ApiResponse<T> {

  Status?status;
  T?data;
  String?msg;
  ApiResponse(this.status,this.data,this.msg);

  ApiResponse.Loading():status=Status.LOADING;
  ApiResponse.Complete(this.data):status=Status.COMPLETE;
  ApiResponse.Error(this.msg):status=Status.ERROR;


  @override
  String toString() {
    return "Status : $status \n Msg:$msg \n data:$data";
  } 
}