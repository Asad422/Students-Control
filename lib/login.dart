
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:missingpeple/home.dart';

import 'helper.dart';

class LoggingIn extends StatefulWidget {
  @override
  
  State<LoggingIn> createState() => _LoggingInState();
}

class _LoggingInState extends State<LoggingIn> {
   String? email;
   String? password;

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

     
    return Scaffold(
     
      body: SingleChildScrollView(
      	
	        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
         
	          children: <Widget>[
	         Container(
            height: 400,
            color: Color.fromRGBO(24,31,199,1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
               
                Image.asset('assets/images/gerb.png',height:80 ,width: 80,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 15),child:
                Text('Вход',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 40)),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 15),child :
                 Divider(
              color: Color.fromRGBO(231, 38, 122, 1,),
              thickness: 5,
              endIndent: 270,
            ))
              ]),

             ),
              Container(
               
                color: Colors.white,
                child:
	            Padding(
	              padding: EdgeInsets.only(top : 30.0),
	              child: Column(
	                children: <Widget>[
	                 Container(
	                    padding: EdgeInsets.all(5),
	                    decoration: BoxDecoration(
	                      color: Colors.white,
	                      borderRadius: BorderRadius.circular(10),
	                      boxShadow: [
	                        BoxShadow(
	                          color: Color.fromRGBO(143, 148, 251, .2),
	                          blurRadius: 20.0,
	                          offset: Offset(0, 10)
	                        )
	                      ]
	                    ),
	                    child: Column(
	                      children: <Widget>[
	                        Container(
                             width: 283,
                            height: 57,
	                          padding: EdgeInsets.symmetric(vertical: 8),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey)),
                           
	                          ),
	                          child: TextField(
                              
                              controller: emailController ,
	                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle,color:  Color.fromRGBO(231, 38, 122, 1,)),
	                              border: InputBorder.none,
	                              hintText: "Почта",
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ),
	                        ),
	                        Container(
                            width: 283,
                            height: 57,
	                          padding: EdgeInsets.symmetric(vertical: 8),
	                          child: TextField(
                              controller: passwordController,
	                            decoration: InputDecoration(
                                 prefixIcon: Icon(Icons.lock,color: Color.fromRGBO(231, 38, 122, 1),),
	                              border: InputBorder.none,
	                              hintText: "Пароль",
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ),
	                        ),
                          
	                      ],
	                    ),
	                  ),
	                  SizedBox(height: 30,),
                    InkWell(onTap: (){
                  
                      setState(() {
                        email = emailController.text;
                        password = passwordController.text;
                      });
                    
                      
                  AuthenticationHelper()
                      .signIn(email: email!, password: password!)
                      .then((result) {
                    if (result == null) {
                    
                          
Navigator.pushAndRemoveUntil( context, MaterialPageRoute(builder: (context) => Home()), (Route<dynamic> route) => false, ); 
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          result,
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                    }});} , child: 
	                  Container(
	                    height: 57,
                      width: 283,
	                    decoration: BoxDecoration(
	                      borderRadius: BorderRadius.circular(10),
	                      color: Color.fromRGBO(24,31,199,1),
	                    ),
	                    child: Center(
	                      child: Text("Войти", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 27),),
	                    )),
                      
	                  ),
                    Padding(padding: EdgeInsets.only(top: 100),child: 
	                 Container(
                    height: 70,
	                   child: Center(
                    child: Text(
                      'V 1.0.0',
                      style: TextStyle(color: Colors.grey,
                    )
                   )),
	                 ))
	                ],
	              ),
              ))
	          ],
	        ),
	      ),
      
    );
  }
}