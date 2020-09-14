import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget{
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey=GlobalKey<FormState>();
  final themeColor =Colors.blueGrey[900];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Form(
            child: Padding(
              padding:const EdgeInsets.only(right: 30,left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Text('EasyNote',
                    style:const TextStyle(
                      letterSpacing: 1,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 25
                    ),
                  ),
                  SizedBox(height: 30,),
                  Theme(
                    data: ThemeData(
                      cardColor: themeColor,
                      primaryColor: themeColor,
                      primaryColorDark: themeColor,
                    ),
                    child: TextFormField(
                      onEditingComplete: ()=>_formKey.currentState.validate(),
                      validator:null,
                      keyboardType:TextInputType.emailAddress,
                      cursorColor: themeColor,
                      style: TextStyle(
                        color: themeColor,
                      ),
                      decoration: InputDecoration(labelText: 'username',
                        enabledBorder:  OutlineInputBorder(
                          borderSide:  BorderSide(color:themeColor),
                        ),
                        border: const OutlineInputBorder(),
                        labelStyle: TextStyle(
                          color: themeColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Theme(
                    data: ThemeData(
                      cardColor: themeColor,
                      primaryColor:themeColor,
                      primaryColorDark: themeColor,
                    ),
                    child: TextFormField(
                      onEditingComplete: ()=>_formKey.currentState.validate(),
                      validator: (password){
                        return password.length<8?'Minimum 8 characters':null;
                      },
                      obscureText: true,
                      cursorColor: themeColor,
                      style: TextStyle(
                        color: themeColor,
                      ),
                      decoration: InputDecoration(labelText: 'password',
                        enabledBorder:  OutlineInputBorder(
                          borderSide:  BorderSide(color:themeColor),
                        ),
                        border: const OutlineInputBorder(),
                        labelStyle: TextStyle(
                          color: themeColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: themeColor,
                      onPressed: () {},
                      child: Text('Login',style: TextStyle(color: Colors.tealAccent),),
                    ),
                  ),
                  SizedBox(height: 15,),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Text("Don't have Account ? Register",
              style: TextStyle(
                color: themeColor,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
