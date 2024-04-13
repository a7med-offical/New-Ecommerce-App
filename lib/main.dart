import 'package:app/provider/add_favourite.dart';
import 'package:app/provider/add_to_card.dart';
import 'package:app/provider/search_provider.dart.dart';
import 'package:app/services/all_catagory.dart';
import 'package:app/services/name_catagory_service.dart';
import 'package:app/view/home.dart';
import 'package:app/view/login.dart';
import 'package:app/view/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatefulWidget {
  const EcommerceApp({super.key});

  @override
  State<EcommerceApp> createState() => _EcommerceAppState();
}

class _EcommerceAppState extends State<EcommerceApp> {
  
@override
  void initState() {
    // TODO: implement initState
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderSearch(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderFav(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderCard(),
        ),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Color.fromARGB(255, 215, 216, 207),
        home: RegisterView(),
      ),
    );
  }
}
