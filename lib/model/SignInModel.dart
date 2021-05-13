class SignInModel{
  int _code;
  String _status;
  String _message;

  SignInModel(this._code, this._status, this._message);

  String get message => _message;
  set message(String value) {
    _message = value;
  }

  String get status => _status;
  set status(String value) {
    _status = value;
  }

  int get code => _code;
  set code(int value) {
    _code = value;
  }

  SignInModel.fromJson(Map<String,dynamic> json){
    _status = json['status'];
    _code = json['code'];
    _message = json['message'];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = _status;
    data['code'] = _code;
    data['message'] = _message;

    return data;
  }

}