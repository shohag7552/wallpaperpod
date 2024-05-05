import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:wallpaperpod_client/wallpaperpod_client.dart';
import 'package:wallpaperpod_flutter/app/view/app.dart';
import 'package:wallpaperpod_flutter/bootstrap.dart';
import 'package:wallpaperpod_flutter/deshboard/dashboard_screen.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
// var client = Client('http://$localhost:8080/')
//   ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  // runApp(const MyApp());
  bootstrap(() => const App());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardScreen(),
      // home: const MyHomePage(title: 'Serverpod Example'),
    );
  }
}
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({required this.title, super.key});
//
//   final String title;
//
//   @override
//   MyHomePageState createState() => MyHomePageState();
// }
//
// class MyHomePageState extends State<MyHomePage> {
//   // These fields hold the last result or error message that we've received from
//   // the server or null if no result exists yet.
//   List<Wallpaper>? _resultMessage;
//   String? _errorMessage;
//
//   final _textEditingController = TextEditingController();
//   final _imageTextEditingController = TextEditingController();
//   final _dateTextEditingController = TextEditingController();
//
//   // Calls the `hello` method of the `example` endpoint. Will set either the
//   // `_resultMessage` or `_errorMessage` field, depending on if the call
//   // is successful.
//   Future<void> _callHello() async {
//     try {
//       // final result = await client.example.hello(_textEditingController.text);
//       final result = await client.wallpaper.createWallpaper(Wallpaper(name: _textEditingController.text, image: _imageTextEditingController.text, date: DateTime.now()),
//       );
//       setState(() {
//         _errorMessage = null;
//         // print('=======result : ${result.toString()}');
//         // _resultMessage = result;
//       });
//     } catch (e) {
//       setState(() {
//         _errorMessage = '$e';
//       });
//     }
//   }
//
//   Future<void> _getWallpaper() async {
//     try {
//       // final result = await client.example.hello(_textEditingController.text);
//       final List<Wallpaper> result = await client.wallpaper.getAllWallpaper();
//       setState(() {
//         _errorMessage = null;
//         // print('=======result : ${result.toString()}');
//         _resultMessage = result;
//       });
//     } catch (e) {
//       setState(() {
//         _errorMessage = '$e';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 16),
//                 child: TextField(
//                   controller: _textEditingController,
//                   decoration: const InputDecoration(
//                     hintText: 'Enter your name',
//                   ),
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 16),
//                 child: TextField(
//                   controller: _imageTextEditingController,
//                   decoration: const InputDecoration(
//                     hintText: 'Enter your image',
//                   ),
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 16),
//                 child: TextField(
//                   controller: _dateTextEditingController,
//                   decoration: const InputDecoration(
//                     hintText: 'Enter your date',
//                   ),
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                       onPressed: _callHello,
//                       child: const Text('Send to Server'),
//                     ),
//
//                     ElevatedButton(
//                       onPressed: _getWallpaper,
//                       child: const Text('Receive from Server'),
//                     ),
//                   ],
//                 ),
//               ),
//
//               _ResultDisplay(
//                 wallpapers: _resultMessage,
//                 errorMessage: _errorMessage,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // _ResultDisplays shows the result of the call. Either the returned result from
// // the `example.hello` endpoint method or an error message.
// class _ResultDisplay extends StatelessWidget {
//
//   const _ResultDisplay({
//     this.wallpapers,
//     this.errorMessage,
//   });
//   final List<Wallpaper>? wallpapers;
//   final String? errorMessage;
//
//   @override
//   Widget build(BuildContext context) {
//     // String text;
//     // Color backgroundColor;
//     // if (errorMessage != null) {
//     //   backgroundColor = Colors.red[300]!;
//     //   text = errorMessage!;
//     // } else if (resultMessage != null) {
//     //   backgroundColor = Colors.green[300]!;
//     //   text = resultMessage!;
//     // } else {
//     //   backgroundColor = Colors.grey[300]!;
//     //   text = 'No server response yet.';
//     // }
//
//     return wallpapers != null ? ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: wallpapers!.length,
//         itemBuilder: (context, index) {
//       return ListTile(
//         title: Text(wallpapers![index].name),
//         leading: Text(wallpapers![index].id.toString()),
//       );
//     },) : const SizedBox();
//   }
// }
