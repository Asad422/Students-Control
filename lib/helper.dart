  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Classes {
  final bool? A10;
  final bool? A9;
  final bool? B9;
  final bool? C9;
    final bool? A8;
  final bool? B8;
  final bool? C8;

  final bool? A7;
  final bool? B7;
  final bool? C7;



  final bool? A6;
  final bool? B6;
  final bool? C6;

  
  final bool? A5;
  final bool? B5;
  final bool? C5;

  final bool? A4;
  final bool? B4;
  final bool? C4;

  final bool? A3;
  final bool? B3;
  final bool? C3;

  final bool? A2;
  final bool? B2;
  final bool? C2;

  final bool? A1;
  final bool? B1;
  final bool? C1;



  Classes( {this.A10,this.A9, this.B9, this.C9, this.A8, this.B8, this.C8, this.A7, this.B7, this.C7, this.A6, this.B6, this.C6, this.A5, this.B5, this.C5, this.A4, this.B4, this.C4, this.A3, this.B3, this.C3, this.A2, this.B2, this.C2, this.A1, this.B1, this.C1, 
  
  });

  factory Classes.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Classes(
      A10: data?['10A'], 
      A9: data?['9A'], B9: data?['9Б'],C9: data?['9B'],
      A8: data?['8A'], B8: data?['8Б'],C8: data?['8B'],
      A7: data?['7A'], B7: data?['7Б'],C7: data?['7B'],
      A6: data?['6A'], B6: data?['6Б'],C6: data?['6B'],
      A5: data?['5A'], B5: data?['5Б'],C5: data?['5B'],
      A4: data?['4A'], B4: data?['4Б'],C4: data?['4B'],
      A3: data?['3A'], B3: data?['3Б'],C3: data?['3B'],
      A2: data?['2A'], B2: data?['2Б'],C2: data?['2B'],
      A1: data?['1A'], B1: data?['1Б'],C1: data?['1B']
      
      
      );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (A10 != null) "10A": A10,
      if(A9 != null)  "9A"  : A9, if(B9 != null)  "9Б"  : B9,if(C9 != null)  "9B"  : C9,
      if(A8 != null)  "8A"  : A8, if(B9 != null)  "8Б"  : B8,if(C8 != null)  "8B"  : C8,
      if(A7 != null)  "7A"  : A7, if(B7 != null)  "7Б"  : B7,if(C7 != null)  "7B"  : C7,
      if(A6 != null)  "6A"  : A6, if(B6 != null)  "6Б"  : B6,if(C6 != null)  "6B"  : C6,
      if(A5 != null)  "5A"  : A5, if(B5 != null)  "5Б"  : B5,if(C8 != null)  "5B"  : C5,
      if(A4 != null)  "4A"  : A4, if(B4 != null)  "4Б"  : B4,if(C4 != null)  "4B"  : C4,
      if(A3 != null)  "3A"  : A3, if(B3 != null)  "3Б"  : B3,if(C3 != null)  "3B"  : C3,
      if(A2 != null)  "2A"  : A2, if(B2 != null)  "2Б"  : B2,if(C2 != null)  "2B"  : C2,
      if(A1 != null)  "1A"  : A1, if(B1 != null)  "1Б"  : B1,if(C1 != null)  "1B"  : C1,
      



      
    };
  }
  
}
class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get user => _auth.currentUser;

  
  Future<String?> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }


    Future <String?> signUp({required String email, required String password,required String name}) async {
      try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await user?.updateDisplayName(name);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }

    
  }
    }
  