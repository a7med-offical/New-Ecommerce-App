import 'package:app/helper/Auth.dart';
import 'package:app/view/home.dart';
import 'package:app/widgets/custom_RowAuth_Text.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:app/widgets/custom_textfield.dart';
import 'package:app/widgets/snack_bar.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  UserModel _userModel = UserModel();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('Assets/images/login.png'),
            const Text(
              'Login',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Please sign in to continue',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Email',
                labelText: 'EMAIL',
                prefixIcon: const Icon(Icons.email)),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                controller: password,
                hintText: 'Password',
                labelText: 'PASSWORD',
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: const IconButton(
                    onPressed: null, icon: Icon(Icons.remove_red_eye))),
            customButton(
              onTap: () => null,
              text: 'LOGIN',
            ),
            const Text(
              'Forget Password ',
              style: TextStyle(fontSize: 20),
            ),
            RowAuthText(
              textStatus: 'You Don\'t have an account ?',
              ButtonStatus: 'Register',
              onPressed: () {
                try {
              _userModel.loginUser(email.text, password.text);
              
              SnackbarUtil.showSnackbar(
        context,
        'You Login Successfully',
        () {},
      );
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) {
                    return const HomeView();
                  }));
} on Exception catch (e) {
  // TODO
}
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
