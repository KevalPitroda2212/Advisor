class CategoryModel{
  int _code;
  String _status;
  String _message;
  List<Category> _data;

  CategoryModel(this._code, this._status, this._message, this._data);

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

  List<Category> get data => _data;
  set data(List<Category> value) {
    _data = value;
  }

  CategoryModel.fromJson(Map<String,dynamic> json){
    _status = json['status'];
    _code = json['code'];
    _message = json['message'];
    if(json['data'] != null){
      _data = new List<Category>();
      json['data'].forEach((e){
        _data.add(new Category.fromJson(e));
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

class Category{
  int _id;
  String _name;
  String _description;
  String _image;

  Category(this._id, this._name, this._description, this._image);

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

  Category.fromJson(Map<String, dynamic> json){
    _id = json['CategoryId'];
    _name = json['CategoryName'];
    _description = json['CategoryDescription'];
    _image = json['CategoryImagePath'];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['CategoryId'] = _id;
    data['CategoryName'] = _name;
    data['CategoryDescription'] = _description;
    data['CategoryImagePath'] = _image;
    return data;
  }
}