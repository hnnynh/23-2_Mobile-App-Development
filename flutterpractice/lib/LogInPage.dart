import 'package:flutter/material.dart';
import './RegisterPage.dart';
import './ChatPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const LogInForm(),
    );
  }
}

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _authentication = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email'
              ),
              onChanged: (value){
                email = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: 'Password'
              ),
              onChanged: (value){
                password = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () async {
              try{
                final currentUser = await _authentication.signInWithEmailAndPassword(email: email, password: password);
                if(currentUser.user != null){
                  _formKey.currentState!.reset();
                }
              }catch(e) {
                print(e);
              }
            }, child: Text('Enter')),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('If you did not register,'),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                }, child: Text('Register your email')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
