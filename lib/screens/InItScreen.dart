import 'package:app_category/api/SignInAPI.dart';
import 'package:app_category/model/SignInModel.dart';
import 'package:app_category/screens/CategoryScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_category/Common.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InItScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormElement();
  }
}

class FormElement extends StatefulWidget {
  @override
  _FormElementState createState() => _FormElementState();
}

class _FormElementState extends State<FormElement> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _numberCont = TextEditingController();
  TextEditingController _pwCont = TextEditingController();
  SharedPreferences prefs;
  bool isChecked=false;
  SignInModel model;

  sendMail(String number, String pw) async{
    print('called');
    // SignInAPI api = SignInAPI();
    // model = await api.signIn(mobileNumber: number,password: pw);
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => CategoryScreen()));
    // db.FirebaseHandle.userLogin(email,pw,context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Advisor',
                  style: TextStyle(
                      color: Common.themeColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Sign In',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: _numberCont,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        decoration: Common.textFormFieldDecoration('Mobile Number'),
                        validator: (val){

                          if(val.isEmpty){
                            return 'Number should not be empty !!';
                          }
                          else{
                            if(val.length == 10){
                              return null;
                            }else{
                              return 'Number must be 10 digit !!';
                            }
                          }
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: _pwCont,
                        decoration: Common.textFormFieldDecoration('Password'),
                        keyboardType: TextInputType.text,
                        maxLength: 15,
                        obscureText: true,
                        validator: (val){
                          if(val.isEmpty){
                            return 'Password should not be empty !!';
                          }else{
                            if(val.length >= 0){
                              return null;
                            }
                            return 'Password should be greater than 6 character';
                          }
                        },
                      ),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: Common.themeColor,
                            checkColor: Colors.white,
                            value: isChecked,
                            onChanged: (val){
                              setState(() {
                                isChecked=val;
                              });
                            },
                          ),
                          GestureDetector(
                            child: Text('Remeber Me'),
                            onTap: (){
                              isChecked ? setState(()=>isChecked = false) : setState(()=>isChecked = true);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        child: Text('Submit'),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                          backgroundColor: MaterialStateColor.resolveWith((states) => Common.btnColor),
                        ),
                        onPressed: (){
                          if(_formKey.currentState.validate()){
                            sendMail(_numberCont.text, _pwCont.text);
                          }else{

                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

