import 'cubit/currentcls_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:missingpeple/login.dart';

import 'admin_panel.dart';

import 'helper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  User? firebaseUser = FirebaseAuth.instance.currentUser;

  var db = FirebaseFirestore.instance;
  int _selectedIndex = 0;

  String teacher = '';
  final Map<String, bool?> ff = {};
  Future get<classes>() async {
    final ref = db
        .collection("Teachers")
        .doc(firebaseUser!.email.toString())
        .withConverter(
          fromFirestore: Classes.fromFirestore,
          toFirestore: (Classes classes, _) => classes.toFirestore(),
        );
    final docSnap = await ref.get();
    final gg = docSnap.data();
    if (gg?.A10 == true) {
      setState(() {
        ff['10A'] = true;
      });
    } else {}
    if (gg?.A9 == true) {
      setState(() {
        ff['9A'] = true;
      });
    } else {}

    if (gg?.B9 == true) {
      setState(() {
        ff['9Б'] = true;
      });
    } else {}


    if (gg?.C9 == true) {
      setState(() {
        ff['9B'] = true;
      });
    } else {}
    





    if (gg?.A8 == true) {
      setState(() {
        ff['8A'] = true;
      });
    } else {}

    if (gg?.B8 == true) {
      setState(() {
        ff['8Б'] = true;
      });
    } else {}


    if (gg?.C8 == true) {
      setState(() {
        ff['8B'] = true;
      });
    } else {}



    if (gg?.A7 == true) {
      setState(() {
        ff['7A'] = true;
      });
    } else {}

    if (gg?.B7 == true) {
      setState(() {
        ff['7Б'] = true;
      });
    } else {}


    if (gg?.C7 == true) {
      setState(() {
        ff['7B'] = true;
      });
    } else {}





    if (gg?.A7 == true) {
      setState(() {
        ff['7A'] = true;
      });
    } else {}

    if (gg?.B7 == true) {
      setState(() {
        ff['7Б'] = true;
      });
    } else {}


    if (gg?.C7 == true) {
      setState(() {
        ff['7B'] = true;
      });
    } else {}



    if (gg?.A6 == true) {
      setState(() {
        ff['6A'] = true;
      });
    } else {}

    if (gg?.B6 == true) {
      setState(() {
        ff['6Б'] = true;
      });
    } else {}


    if (gg?.C6 == true) {
      setState(() {
        ff['6B'] = true;
      });
    } else {}



    if (gg?.A5 == true) {
      setState(() {
        ff['5A'] = true;
      });
    } else {}

    if (gg?.B5 == true) {
      setState(() {
        ff['5Б'] = true;
      });
    } else {}


    if (gg?.C5 == true) {
      setState(() {
        ff['5B'] = true;
      });
    } else {}


    if (gg?.A4 == true) {
      setState(() {
        ff['4A'] = true;
      });
    } else {}

    if (gg?.B4 == true) {
      setState(() {
        ff['4Б'] = true;
      });
    } else {}


    if (gg?.C4 == true) {
      setState(() {
        ff['4B'] = true;
      });
    } else {}



    if (gg?.A3 == true) {
      setState(() {
        ff['3A'] = true;
      });
    } else {}

    if (gg?.B3 == true) {
      setState(() {
        ff['3Б'] = true;
      });
    } else {}


    if (gg?.C3 == true) {
      setState(() {
        ff['3B'] = true;
      });
    } else {}



    if (gg?.A2 == true) {
      setState(() {
        ff['2A'] = true;
      });
    } else {}

    if (gg?.B2 == true) {
      setState(() {
        ff['2Б'] = true;
      });
    } else {}


    if (gg?.C2 == true) {
      setState(() {
        ff['2B'] = true;
      });
    } else {}


    if (gg?.A1 == true) {
      setState(() {
        ff['1A'] = true;
      });
    } else {}

    if (gg?.B1 == true) {
      setState(() {
        ff['1Б'] = true;
      });
    } else {}


    if (gg?.C1 == true) {
      setState(() {
        ff['1B'] = true;
      });
    } else {}
  }
  

  

  bool permission_panel = false;
  @override
  void initState() {
    var email = firebaseUser!.email.toString();
    teacher = firebaseUser!.displayName.toString();
    get();
    if (email == 'admin@gmail.com') {
      setState(() {
        permission_panel = true;
      });
    } else {
      setState(() {
        permission_panel = false;
      });
    }
    super.initState();
  }

  List<Widget> _widgetOptions = <Widget>[Presence(), Missing()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentclsCubit,CurrentclsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
             actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.info,
        color: Colors.white,
      ),
      onPressed: () {
        // do something
      }),],
              backgroundColor: Color.fromRGBO(24, 31, 199, 1),
              title: Text(state.selectedClass.toString())),
          body: _widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Присутствуют',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.disabled_by_default),
                label: 'Отсутствуют',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color.fromRGBO(24, 31, 199, 1),
            onTap: _onItemTapped,
          ),
          drawer: Drawer(
              backgroundColor: Color.fromRGBO(24, 31, 199, 1),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: DrawerHeader(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/avatar.png"),
                                fit: BoxFit.contain)),
                        child: null,
                      ),
                    ),
                Visibility(
                    visible: !permission_panel,
                    child: Text(
                      teacher,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: 25),
                    )),
                Text(
                  firebaseUser!.email.toString(),
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      fontSize: 25),
                ),
                Visibility(
                  visible: permission_panel,
                  child: Padding(
                    padding: const EdgeInsets.only( top : 10),
                    child: InkWell(
                      child : 
                       Container(
	                    height: 57,
                        width: 283,
	                    decoration: BoxDecoration(
	                      borderRadius: BorderRadius.circular(10),
	                      color: Colors.white,

                          
	                    ),
                      
                      
                      child: Center
                      (
                        child: Text("Админ - панель", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20)),
                      ),),
	                   
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminPanel()),
                        )),
                  )
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                      itemCount: ff.length,
                      itemBuilder: (BuildContext context, int index) {
                        String key = ff.keys.elementAt(index);
                        return InkWell(
                            onTap: () {
                              BlocProvider.of<CurrentclsCubit>(context)
                                  .selectClass(key);
                            },
                            child: Card(
                                elevation: 3,
                                child: ListTile(
                                  title: Text(
                                    key,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                )));
                      }),
                ),
                Row(mainAxisAlignment : MainAxisAlignment.end,                children: [
              
                  FloatingActionButton(
                      backgroundColor: Color.fromRGBO(
                        231,
                        38,
                        122,
                        1,
                      ),
                      onPressed: () {
                         BlocProvider.of<CurrentclsCubit>(context)
                                  .selectClass("");
                        _signOut();
                       Navigator.pushAndRemoveUntil( context, MaterialPageRoute(builder: (context) => LoggingIn()), (Route<dynamic> route) => false, ); 
                      },
                      child: Icon(Icons.logout_sharp))
                ]),
            ]),
        ));
      },
    );
  }
}

class Presence extends StatefulWidget {
  @override
  State<Presence> createState() => _PresenceState();
}

class _PresenceState extends State<Presence> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentclsCubit, CurrentclsState>(
        builder: (context, state) {
      return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Classes")
              .where("name", isEqualTo: state.selectedClass)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Что-то пошло не так');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: LoadingAnimationWidget.fallingDot(
                      color: Color.fromRGBO(
                        231,
                        38,
                        122,
                        1,
                      ),
                      size: 200));
            }

            return ListView(
              shrinkWrap: true,
              children: snapshot.data!.docs
                  .map((DocumentSnapshot document) {
                    return ListView.separated(
                      separatorBuilder: (context, index) {
                          return Divider(thickness: 2, color: Colors.black);},
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: document['Присутствующие'].length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text("${index + 1}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            title: Text(
                              document['Присутствующие'][index],
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20.0),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.check,
                                    size: 20.0,
                                    color: Colors.green[900],
                                  ),
                                        onPressed: () {
                                          FirebaseFirestore.instance
                                              .collection("Classes")
                                              .doc(state.selectedClass)
                                              .update({
                                            "Присутствующие":
                                                FieldValue.arrayRemove([
                                              document['Присутствующие'][index]
                                            ])
                                          }).then((value) => FirebaseFirestore
                                                      .instance
                                                      .collection("Classes")
                                                      .doc(state.selectedClass)
                                                      .update({
                                                    "Отсутствующие":
                                                        FieldValue.arrayUnion([
                                                      document['Присутствующие']
                                                          [index]
                                                    ])
                                                  }));
                                        },
                                      ),
                                    ],
                                  ));
                        });
                  })
                  .toList()
                  .cast(),
            );
          },
        ),
      );
    });
  }
}

class Missing extends StatefulWidget {
  @override
  State<Missing> createState() => _MissingState();
}

class _MissingState extends State<Missing> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentclsCubit, CurrentclsState>(
        builder: (context, state) {
      return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Classes')
              .where("name", isEqualTo: state.selectedClass)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Что-то пошло не так');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: LoadingAnimationWidget.fallingDot(
                      color: Color.fromRGBO(
                        231,
                        38,
                        122,
                        1,
                      ),
                      size: 200));
            }

            return ListView(
              shrinkWrap: true,
              children: snapshot.data!.docs
                  .map((DocumentSnapshot document) {
                    return ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(thickness: 2, color: Colors.black);
                        },
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: document['Отсутствующие'].length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text("${index + 1}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            title: Text(
                              document['Отсутствующие'][index],
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20.0),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.check,
                                    size: 20.0,
                                    color: Colors.green[900],
                                  ),
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection("Classes")
                                        .doc(state.selectedClass)
                                        .update({
                                      "Отсутствующие": FieldValue.arrayRemove(
                                          [document['Отсутствующие'][index]])
                                    }).then((value) => FirebaseFirestore
                                                .instance
                                                .collection("Classes")
                                                .doc(state.selectedClass)
                                                .update({
                                              "Присутствующие":
                                                  FieldValue.arrayUnion([
                                                document['Отсутствующие'][index]
                                              ])
                                            }));
                                  },
                                ),
                              ],
                            ),
                          );
                        });
                  })
                  .toList()
                  .cast(),
            );
          },
        ),
      );
    });
  }
}
