import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'cubit/admincubit_cubit.dart';
import 'helper.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({Key? key}) : super(key: key);
  Widget build(BuildContext context){
    return BlocProvider(create:  (context) => AdmincubitCubit(),
  
    child : MyWidget()
    );
  }
}



class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    var db = FirebaseFirestore.instance;
      String? email;
      String? password;
      String? name;

    

  
           



      Future<void> setSetting(String? name,
       bool? A10,
                    bool? B9, bool? C9, bool? A9,
        bool? B8, bool? C8, bool? A8,
        bool? B7, bool? C7, bool? A7,
        bool? B6, bool? C6, bool? A6,
        bool? B5, bool? C5, bool? A5,
        bool? B4, bool? C4, bool? A4,
        bool? B3, bool? C3, bool? A3,
        bool? B2, bool? C2, bool? A2,
        bool? B1, bool? C1, bool? A1,

        
      
      ) async {
       final teacher = <String, dynamic>{
  "name": name,
  "10A": A10,
  "9A": A9,
  "9Б" : B9,
  "9B" :C9,

  "8A": A8,
  "8Б" : B8,
  "8B" :C8,

  "7A": A7,
  "7Б" : B7,
  "7B" :C7,

  "6A": A6,
  "6Б" : B6,
  "6B" :C6,

  "5A": A5,
  "5Б" : B5,
  "5B" :C5,

  "4A": A4,
  "4Б" : B4,
  "4B" :C4,


  "3A": A3,
  "3Б" : B3,
  "3B" :C3,

  "2A": A2,
  "2Б" : B2,
  "2B" :C2,
  
   "1A": A1,
  "1Б" : B1,
  "1B" :C1,
  
};

db
    .collection("Teachers")
    .doc("$email")
    .set(teacher);
      }

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    return 
    
    BlocBuilder<AdmincubitCubit,AdmincubitState>(
      builder: (context, state) {
        return
    Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar (title :Text('Админ - панель'),  backgroundColor: Color.fromRGBO(24,31,199,1),),

      body: 
       SingleChildScrollView(
        child:
      Center(
       
                child:
	            Padding(
	              padding: EdgeInsets.all(30.0),
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
                            decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey)),
                           
	                          ),
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
                           Container(
                            width: 283,
                            height: 57,
	                          padding: EdgeInsets.symmetric(vertical: 8),
	                          child: TextField(
                              controller: nameController,
	                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.abc,color: Color.fromRGBO(231, 38, 122, 1)),
	                              border: InputBorder.none,
	                              hintText: "Имя Фамилия ",
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ),
	                        ),
                         
                       
                          
	                      ],
	                    ),
	                  ),
                     

          SizedBox(height: 30,),
                      Container(
                         width: 283,
                            height: 250,
                        child:
                   SwtichScroll() ),
           SizedBox(height: 30,),
                   
                          InkWell(onTap: (){
                          

                    

                            
                  
                      setState(() {
                        email = emailController.text;
                        password = passwordController.text;
                        name = nameController.text;
                      });
                      

                      
                      
                  AuthenticationHelper().signUp(email: email!, password: password!, name : name!)
                      .then((result) {
                    if (result == null) {
                       setSetting( name, 
                       
                       state.classes['10A'],
                        state.classes['9Б'], state.classes['9B'],state.classes['9A'],
                       state.classes['8Б'], state.classes['8B'],state.classes['8A'],
                       state.classes['7Б'], state.classes['7B'],state.classes['7A'],
                       state.classes['6Б'], state.classes['6B'],state.classes['6A'],
                      state.classes['5Б'], state.classes['5B'],state.classes['5A'],
                       state.classes['4Б'], state.classes['4B'],state.classes['4A'],
                      state.classes['3Б'], state.classes['3B'],state.classes['3A'],
                       state.classes['2Б'], state.classes['2B'],state.classes['2A'],
                       state.classes['1Б'], state.classes['1B'],state.classes['1A']

                       
                       
                       
                       
                       );
                    AuthenticationHelper().signIn(email: 'admin@gmail.com', password: '555555').then((value) =>  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Учитель успешно зарегистрирован',
                          style: TextStyle(fontSize: 16),
                        ),
                      )));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          result,
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                    }}
                    
                    
                    
                    );

                         
                    
                    } , child: 
	                  Container(
	                    height: 57,
                      width: 283,
	                    decoration: BoxDecoration(
	                      borderRadius: BorderRadius.circular(10),
	                      color: Color.fromRGBO(24,31,199,1),
	                    ),
	                    child: Center(
	                      child: Text("Зарегистрировать", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 27),),
	                    )),
                      
	                  )
                    
                          
    ])
              )
      )));
      
  });}
}
class SwtichScroll extends StatefulWidget {
  SwtichScroll({Key? key}) : super(key: key);

  @override
  State<SwtichScroll> createState() => _SwtichScrollState();
}

class _SwtichScrollState extends State<SwtichScroll> {
  @override
  Widget build(BuildContext context) {
    return 
 BlocBuilder<AdmincubitCubit,AdmincubitState>(
      builder: (context, state) {
        return
 ListView.builder(
                        itemCount: state.classes.length,
                        itemBuilder: (BuildContext context, int index) {
                          String key = state.classes.keys.elementAt(index);
                          return
    Card(
      
      
        child :

        Padding(padding:EdgeInsets.all(6) ,
        child : 
        Row (
      
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children : [ 
            Text(key),
            FlutterSwitch(

              height: 30,
              width:50 ,
              toggleSize: 25,

        value: state.classes[key]!,
        activeColor:Color.fromRGBO(231, 38, 122, 1),
        
       
       onToggle: (bool value) { 
 
          setState(() {
            state.classes[key] = value;
            state.classes.update(key, (value) => value);
          });
        
   },
      )]
        
     )));
   } );
});}}


