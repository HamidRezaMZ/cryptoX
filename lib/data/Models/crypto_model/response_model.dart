class ResponseModel<T>{
  late Status status;
  late T data;
  late String message;
  ResponseModel.loading(this.message) : status = Status.LOADING;
  ResponseModel.completed(this.data) : status = Status.COMPLETED;
  ResponseModel.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    // TODO: implement toString
    return 'Status : $status \nMessage : $message \nData : $data';
  }
}
enum Status {LOADING,COMPLETED,ERROR}