class SubCategoryModel{
  int _code;
  String _status;
  String _message;
  List<SubCategory> _data;

  SubCategoryModel(this._code, this._status, this._message, this._data);

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

  List<SubCategory> get data => _data;
  set data(List<SubCategory> value) {
    _data = value;
  }

  SubCategoryModel.fromJson(Map<String,dynamic> json){
    _status = json['status'];
    _code = json['code'];
    _message = json['message'];
    if(json['data'] != null){
      _data = new List<SubCategory>();
      json['data'].forEach((e){
        _data.add(new SubCategory.fromJson(e));
      });
    }
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = _status;
    data['code'] = _code;
    data['message'] = _message;

    if(_message != null){
      data['data'] = _data.map((e) => e.toJson()).toList();
    }

    return data;
  }

}

class SubCategory{
  int _id;
  int _subId;
  String _name;
  String _description;
  String _image;

  SubCategory(this._id, this._name, this._description, this._image,this._subId);

  String get image => _image;
  set image(String value) {
    _image = value;
  }

  String get description => _description;
  set description(String value) {
    _description = value;
  }

  String get name => _name;
  set name(String value) {
    _name = value;
  }

  int get id => _id;
  set id(int value) {
    _id = value;
  }

  int get subId => _subId;
  set subId(int value) {
    _subId = value;
  }

  SubCategory.fromJson(Map<String, dynamic> json){
    _id = json['CategoryId'];
    _subId = json['SubCategoryId'];
    _name = json['SubCategoryName'];
    _description = json['SubCategoryDescription'];
    _image = json['SubCategoryImagePath'];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['CategoryId'] = _id;
    data['SubCategoryId'] = _subId;
    data['SubCategoryName'] = _name;
    data['SubCategoryDescription'] = _description;
    data['SubCategoryImagePath'] = _image;
    return data;
  }
}