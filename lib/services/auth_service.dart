import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Stream of auth changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign up with email and password
  Future<UserModel?> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      // Create user with email and password
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        print('User creation failed: No user returned');
        return null;
      }

      final user = userCredential.user!;
      
      // Create user data map
      final userData = {
        'uid': user.uid,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'role': 'user',
        'registrationDate': Timestamp.now(),
      };

      // Save user data to Firestore
      await _firestore.collection('users').doc(user.uid).set(userData);

      // Return user model
      return UserModel(
        uid: user.uid,
        email: email,
        firstName: firstName,
        lastName: lastName,
        role: 'user',
        registrationDate: DateTime.now(),
      );
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Error during sign up: ${e.code} - ${e.message}');
      return null;
    } catch (e) {
      print('Unexpected error during sign up: $e');
      return null;
    }
  }

  // Sign in with email and password
  Future<UserModel?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        print('Sign in failed: No user returned');
        return null;
      }

      final user = userCredential.user!;

      // Try to get user data from Firestore
      try {
        final doc = await _firestore.collection('users').doc(user.uid).get();
        
        if (!doc.exists) {
          print('User document not found in Firestore, creating new document');
          // Create a new user document if it doesn't exist
          final userData = {
            'uid': user.uid,
            'email': user.email,
            'firstName': 'Unknown',
            'lastName': 'User',
            'role': 'user',
            'registrationDate': Timestamp.now(),
          };
          
          await _firestore.collection('users').doc(user.uid).set(userData);
          return UserModel.fromMap(userData);
        }

        final data = doc.data();
        if (data == null) {
          print('User data is null');
          return null;
        }

        return UserModel.fromMap(data);
      } catch (e) {
        print('Error accessing Firestore: $e');
        // If Firestore fails, still return a basic user model
        return UserModel(
          uid: user.uid,
          email: user.email ?? email,
          firstName: 'Unknown',
          lastName: 'User',
          role: 'user',
          registrationDate: DateTime.now(),
        );
      }
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Error during sign in: ${e.code} - ${e.message}');
      return null;
    } catch (e) {
      print('Unexpected error during sign in: $e');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error during sign out: $e');
      rethrow;
    }
  }

  // Get user data
  Future<UserModel?> getUserData(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (!doc.exists) {
        print('User document not found in Firestore');
        return null;
      }

      final data = doc.data();
      if (data == null) {
        print('User data is null');
        return null;
      }

      return UserModel.fromMap(data);
    } catch (e) {
      print('Error getting user data: $e');
      return null;
    }
  }

  // Update user profile
  Future<bool> updateProfile({
    required String uid,
    String? firstName,
    String? lastName,
    String? email,
  }) async {
    try {
      final updateData = <String, dynamic>{};
      if (firstName != null) updateData['firstName'] = firstName;
      if (lastName != null) updateData['lastName'] = lastName;
      if (email != null) updateData['email'] = email;

      await _firestore.collection('users').doc(uid).update(updateData);
      return true;
    } catch (e) {
      print('Error updating profile: $e');
      return false;
    }
  }
} 