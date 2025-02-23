import 'package:flutter/material.dart';
import 'package:wind_space_members/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WIND SPACE',
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Colors.white12,
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('WIND SPACE')),
        body: LayoutBuilder(builder: (context, constraints) {
          // final double width = constraints.maxWidth;
          // final int crossAxisCount = width;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio:
                    MediaQuery.of(context).size.aspectRatio > 1 ? 4 / 3 : 3 / 2,
              ),
              itemCount: 5,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildCard(LoginCard());
                } else {
                  return _buildCard(Text('No Data'));
                }
              },
            ),
          );
        }));
  }

  Widget _buildCard(Widget child) {
    return SizedBox(
      width: double.infinity,
      child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: child,
          )),
    );
  }
}
