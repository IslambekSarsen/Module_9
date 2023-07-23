import 'dart:convert';
import 'dart:core';
import 'package:bloc/module_9/details.dart';
import 'package:bloc/module_9/hotels_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/user.dart';
import 'package:dio/dio.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomeView.routeName:
            return MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => const HomeView(),
            );
          case Details.routeName:
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => Details(
                uuid: args['uuid'],
              ),
            );
          default:
            print('Nothing...');
        }
      },
      home: HomeView(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   bool isLoading = false;
//   bool hasError = false;
//   late List<User> users;
//   Dio _dio = Dio();
//
//   @override
//   void initState() {
//     super.initState();
//     getDataDio();
//   }
//
//   getDataDio() async {
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       final response = await _dio.get('https://run.mocky.io/v3/af5ffb01-5cc0-4b87-95b5-47b0fcce1c96');
//       users = response.data.map<User>((user) => User.fromJson(user)).toList();
//     } on DioError catch (e) {
//       print(e.error);
//       setState(() {
//         hasError = true;
//       });
//     }
//
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : hasError
//           ? Text('Error')
//           : ListView(
//               children: <Widget>[
//                 ...users.map((user) {
//                   return ListTile(
//                     title: Text(user.email),
//                     subtitle: Text(user.address.city),
//                   );
//                 }).toList(),
//         ],
//       )
//     );
//   }
// }
