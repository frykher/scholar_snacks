import 'package:flutter/material.dart';
import 'package:scholar_snacks/sign_up.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Navigation.dart';
import 'login_demo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: 'https://iiqzifxwahrdpfnrzuxy.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlpcXppZnh3YWhyZHBmbnJ6dXh5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDUzNTUwMzcsImV4cCI6MjAyMDkzMTAzN30.eIqbo8of1yKyRMbSoe5oAsfgoEIiRu9kIDQ0IOtCSOo');

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    // await for for the widget to mount
    await Future.delayed(Duration.zero);

    final session = supabase.auth.currentSession;
    if (session == null) {
      Navigator.of(context)
          .pushAndRemoveUntil(MaterialPageRoute(
                              builder: (context) => const SignUpPage()), (route) => false);
    } else {
      Navigator.of(context)
          .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Navigation()), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(
      child: CircularProgressIndicator(color: Colors.deepPurple)
    ));
  }
}