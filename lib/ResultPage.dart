// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:intl/intl.dart';
// import 'package:video_player/video_player.dart';


// class ResultPage extends StatefulWidget {
//   ResultPage({
//     Key? key,
//     required this.title,
//     required this.video1File,
//     required this.video2File,
//   }) : super(key: key);
//   PickedFile video1File;
//   PickedFile video2File;
//   final String title;

//   @override
//   _ResultPageState createState() => _ResultPageState();
// }

// class _ResultPageState extends State<ResultPage> {
//   String grade = '';
//   List links = [];
//   // VideoPlayerController? controller;

//   @override
//   void initState() {
//     // loadVideoPlayer();
//     super.initState();
//     uploadFileToServer();
//   }


 

//   Future<void> _saveImages(links) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> dates = [];
//     dates = prefs.getStringList('date') ?? [];

//     var now = new DateTime.now();
//     var formatter = new DateFormat('yyyy-MM-dd hh:mm a');
//     String formattedDate = formatter.format(now);
//     dates.add(formattedDate);
//     prefs.setStringList('date', dates);
//     prefs.setString(formattedDate, json.encode(links));
//   }

//   void uploadFileToServer() async {
//     // This url is for local server. Then this url'll change to the public url
//     var url = 'http://192.168.86.22:5000';
//     Map<String, String> headers = {
//       "Connection": "Keep-Alive",
//       "Keep-Alive": "timeout=5, max=1000"
//     };

//     http.MultipartRequest request =
//     http.MultipartRequest('POST', Uri.parse('$url/analize'));
//     request.headers.addAll(headers);
//     request.files.add(
//       await http.MultipartFile.fromPath(
//         'video1',
//         widget.video1File.path,
//         contentType: MediaType('application', 'mp4'),
//       ),
//     );

//     request.files.add(
//       await http.MultipartFile.fromPath(
//         'video2',
//         widget.video2File.path,
//         contentType: MediaType('application', 'mp4'),
//       ),
//     );

//     request.send().then((r) async {
//       print(r.statusCode);

//       if (r.statusCode == 200) {
//         // print((json.decode(await r.stream.transform(utf8.decoder).join())).runtimeType);
//         var result = json.decode(await r.stream.transform(utf8.decoder).join());
//         print("--------------------------------");
//         print(result);
//         grade = result[1];
//         _saveImages(result);
//         setState(() {
//           links = result[0];
          
//         });
//         print(links[0][0]);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: links != null
//           ? Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListView.separated(
//               padding: const EdgeInsets.all(8),
//               itemCount: links.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListView(
//                   shrinkWrap: true,
//                   physics: ClampingScrollPhysics(),
//                   children: [
//                     Text(
//                       'Video 1',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     Image.network(links[0][0]),
//                     Text(
//                       'Video 2',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     Image.network(links[0][1]),
//                     Text(
//                       '$grade',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ],
//                 );
//               },
//               separatorBuilder: (BuildContext context, int index) =>
//               const Divider(),
//             ),
//           ))
//           : Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CircularProgressIndicator(),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text('Analyzing videos'),
//               ),
              
//             ],
//           )),
//     );
//   }
// }




// --------------------------- version2

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:intl/intl.dart';
// import 'package:video_player/video_player.dart';


// class ResultPage extends StatefulWidget {
//   ResultPage({
//     Key? key,
//     required this.title,
//     required this.video1File,
//     required this.video2File,
//   }) : super(key: key);
//   PickedFile video1File;
//   PickedFile video2File;
//   final String title;

//   @override
//   _ResultPageState createState() => _ResultPageState();
// }

// class _ResultPageState extends State<ResultPage> {
//   String grade = '';
//   List links = [];
//   // VideoPlayerController? controller;
//   late VideoPlayerController controller;

//   @override
//   void initState() {
//     // loadVideoPlayer();
//     super.initState();
//     uploadFileToServer();
//     loadVideoPlayer();
//   }

//   loadVideoPlayer(){
//     controller = VideoPlayerController.network('https://www.fluttercampus.com/video.mp4');
//     controller.addListener(() {
//       setState(() {});
//     });
//     controller.initialize().then((value){
//       setState(() {});
//     });

//   }



//   Future<void> _saveImages(links) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> dates = [];
//     dates = prefs.getStringList('date') ?? [];

//     var now = new DateTime.now();
//     var formatter = new DateFormat('yyyy-MM-dd hh:mm a');
//     String formattedDate = formatter.format(now);
//     dates.add(formattedDate);
//     prefs.setStringList('date', dates);
//     prefs.setString(formattedDate, json.encode(links));
//   }

//   void uploadFileToServer() async {
//     // This url is for local server. Then this url'll change to the public url
//     var url = 'http://192.168.1.171:5000';
//     Map<String, String> headers = {
//       "Connection": "Keep-Alive",
//       "Keep-Alive": "timeout=5, max=1000"
//     };

//     http.MultipartRequest request =
//     http.MultipartRequest('POST', Uri.parse('$url/analize'));
//     request.headers.addAll(headers);
//     request.files.add(
//       await http.MultipartFile.fromPath(
//         'video1',
//         widget.video1File.path,
//         contentType: MediaType('application', 'mp4'),
//       ),
//     );

//     request.files.add(
//       await http.MultipartFile.fromPath(
//         'video2',
//         widget.video2File.path,
//         contentType: MediaType('application', 'mp4'),
//       ),
//     );

//     request.send().then((r) async {
//       print(r.statusCode);

//       if (r.statusCode == 200) {
//         // print((json.decode(await r.stream.transform(utf8.decoder).join())).runtimeType);
//         var result = json.decode(await r.stream.transform(utf8.decoder).join());
//         print("--------------------------------");
//         print(result);
//         grade = result[1];
//         _saveImages(result);
//         setState(() {
//           links = result[0];

//         });
//         print(links[0][0]);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: links != null
//           ? Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListView.separated(
//               padding: const EdgeInsets.all(8),
//               itemCount: links.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListView(
//                   shrinkWrap: true,
//                   physics: ClampingScrollPhysics(),
//                   children: [
//                     Text(
//                       'Video 1',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     Container(
//                       child: Row(
//                         children: [
//                           IconButton(
//                               onPressed: (){
//                                 if(controller.value.isPlaying){
//                                   controller.pause();
//                                 }else{
//                                   controller.play();
//                                 }

//                                 setState(() {

//                                 });
//                               },
//                               icon:Icon(controller.value.isPlaying?Icons.pause:Icons.play_arrow)
//                           ),

//                           IconButton(
//                               onPressed: (){
//                                 controller.seekTo(Duration(seconds: 0));

//                                 setState(() {

//                                 });
//                               },
//                               icon:Icon(Icons.stop)
//                           )
//                         ],
//                       ),
//                     ),
//                     Text(
//                       'Video 2',
//                       style: TextStyle(fontSize: 20),
//                     ),Container(
//                       child: Row(
//                         children: [
//                           IconButton(
//                               onPressed: (){
//                                 if(controller.value.isPlaying){
//                                   controller.pause();
//                                 }else{
//                                   controller.play();
//                                 }

//                                 setState(() {

//                                 });
//                               },
//                               icon:Icon(controller.value.isPlaying?Icons.pause:Icons.play_arrow)
//                           ),

//                           IconButton(
//                               onPressed: (){
//                                 controller.seekTo(Duration(seconds: 0));

//                                 setState(() {

//                                 });
//                               },
//                               icon:Icon(Icons.stop)
//                           )
//                         ],
//                       ),
//                     ),
//                     Image.network(links[0][1]),
//                     Text(
//                       '$grade',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ],
//                 );
//               },
//               separatorBuilder: (BuildContext context, int index) =>
//               const Divider(),
//             ),
//           ))
//           : Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CircularProgressIndicator(),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text('Analyzing videos'),
//               ),

//             ],
//           )),
//     );
//   }
// }

//------------------------------------------------ version3
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:intl/intl.dart';
// import 'package:video_player/video_player.dart';


// class ResultPage extends StatefulWidget {
//   ResultPage({
//     Key? key,
//     required this.title,
//     required this.video1File,
//     required this.video2File,
//   }) : super(key: key);
//   PickedFile video1File;
//   PickedFile video2File;
//   final String title;

//   @override
//   _ResultPageState createState() => _ResultPageState();
// }

// class _ResultPageState extends State<ResultPage> {
//   String grade = '';
//   List links = [];
//   // VideoPlayerController? controller;
//   late VideoPlayerController controller1;
//   late VideoPlayerController controller2;

//   @override
//   void initState() {
//     // loadVideoPlayer();
//     super.initState();
//     uploadFileToServer();
//     loadVideoPlayer();
//   }

//   loadVideoPlayer(){
//     controller1 = VideoPlayerController.network('https://www.fluttercampus.com/video.mp4');
//     controller1.addListener(() {
//       setState(() {});
//     });
//     controller1.initialize().then((value){
//       setState(() {});
//     });

//     controller2 = VideoPlayerController.network('https://www.fluttercampus.com/video.mp4');
//     controller2.addListener(() {
//       setState(() {});
//     });
//     controller2.initialize().then((value){
//       setState(() {});
//     });

//   }



//   Future<void> _saveImages(links) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> dates = [];
//     dates = prefs.getStringList('date') ?? [];

//     var now = new DateTime.now();
//     var formatter = new DateFormat('yyyy-MM-dd hh:mm a');
//     String formattedDate = formatter.format(now);
//     dates.add(formattedDate);
//     prefs.setStringList('date', dates);
//     prefs.setString(formattedDate, json.encode(links));
//   }

//   void uploadFileToServer() async {
//     // This url is for local server. Then this url'll change to the public url
//     var url = 'http://192.168.86.95:5000';
//     Map<String, String> headers = {
//       "Connection": "Keep-Alive",
//       "Keep-Alive": "timeout=5, max=1000"
//     };

//     http.MultipartRequest request =
//     http.MultipartRequest('POST', Uri.parse('$url/analize'));
//     request.headers.addAll(headers);
//     request.files.add(
//       await http.MultipartFile.fromPath(
//         'video1',
//         widget.video1File.path,
//         contentType: MediaType('application', 'mp4'),
//       ),
//     );

//     request.files.add(
//       await http.MultipartFile.fromPath(
//         'video2',
//         widget.video2File.path,
//         contentType: MediaType('application', 'mp4'),
//       ),
//     );

//     request.send().then((r) async {
//       print(r.statusCode);

//       if (r.statusCode == 200) {
//         // print((json.decode(await r.stream.transform(utf8.decoder).join())).runtimeType);
//         var result = json.decode(await r.stream.transform(utf8.decoder).join());
//         print("--------------------------------");
//         print(result);
//         grade = result[1];
//         _saveImages(result);
//         setState(() {
//           links = result[0];

//         });
//         print(links[0][0]);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: links != null
//           ? Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListView.separated(
//               padding: const EdgeInsets.all(8),
//               itemCount: links.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListView(
//                   shrinkWrap: true,
//                   physics: ClampingScrollPhysics(),
//                   children: [
//                     Text(
//                       'Video 1',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     Container(
//                       child: Row(
//                         children: [
//                           IconButton(
//                               onPressed: (){
//                                 if(controller1.value.isPlaying){
//                                   controller1.pause();
//                                 }else{
//                                   controller1.play();
//                                 }

//                                 setState(() {

//                                 });
//                               },
//                               icon:Icon(controller1.value.isPlaying?Icons.pause:Icons.play_arrow)
//                           ),

//                           IconButton(
//                               onPressed: (){
//                                 controller1.seekTo(Duration(seconds: 0));

//                                 setState(() {

//                                 });
//                               },
//                               icon:Icon(Icons.stop)
//                           )
//                         ],
//                       ),
//                     ),
//                     Text(
//                       'Video 2',
//                       style: TextStyle(fontSize: 20),
//                     ),Container(
//                       child: Row(
//                         children: [
//                           IconButton(
//                               onPressed: (){
//                                 if(controller2.value.isPlaying){
//                                   controller2.pause();
//                                 }else{
//                                   controller2.play();
//                                 }

//                                 setState(() {

//                                 });
//                               },
//                               icon:Icon(controller2.value.isPlaying?Icons.pause:Icons.play_arrow)
//                           ),

//                           IconButton(
//                               onPressed: (){
//                                 controller2.seekTo(Duration(seconds: 0));

//                                 setState(() {

//                                 });
//                               },
//                               icon:Icon(Icons.stop)
//                           )
//                         ],
//                       ),
//                     ),
//                     Text(
//                       '$grade',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ],
//                 );
//               },
//               separatorBuilder: (BuildContext context, int index) =>
//               const Divider(),
//             ),
//           ))
//           : Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CircularProgressIndicator(),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text('Analyzing videos'),
//               ),

//             ],
//           )),
//     );
//   }
// }

// //---------------------------version 4
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class ResultPage extends StatefulWidget {
  ResultPage({
    Key? key,
    required this.title,
    required this.video1File,
    required this.video2File,
  }) : super(key: key);
  PickedFile video1File;
  PickedFile video2File;
  final String title;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String grade = '';
  List links = [];
  // VideoPlayerController? controller;
  late VideoPlayerController controller1;
  late VideoPlayerController controller2;

  @override
  void initState() {
    // loadVideoPlayer();
    super.initState();
    uploadFileToServer();
  }

  loadVideoPlayer(){
    controller1 = VideoPlayerController.network(links[0][0]);
    controller1.addListener(() {
      setState(() {});
    });
    controller1.initialize().then((value){
      setState(() {});
    });

    controller2 = VideoPlayerController.network(links[0][1]);
    controller2.addListener(() {
      setState(() {});
    });
    controller2.initialize().then((value){
      setState(() {});
    });

  }



  Future<void> _saveImages(links) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> dates = [];
    dates = prefs.getStringList('date') ?? [];

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd hh:mm a');
    String formattedDate = formatter.format(now);
    dates.add(formattedDate);
    prefs.setStringList('date', dates);
    prefs.setString(formattedDate, json.encode(links));
  }

  void uploadFileToServer() async {
    // This url is for local server. Then this url'll change to the public url
    var url = 'http://54.193.193.216:5000';
    Map<String, String> headers = {
      "Connection": "Keep-Alive",
      "Keep-Alive": "timeout=5, max=1000"
    };

    http.MultipartRequest request =
    http.MultipartRequest('POST', Uri.parse('$url/analize'));
    request.headers.addAll(headers);
    request.files.add(
      await http.MultipartFile.fromPath(
        'video1',
        widget.video1File.path,
        contentType: MediaType('application', 'mp4'),
      ),
    );

    request.files.add(
      await http.MultipartFile.fromPath(
        'video2',
        widget.video2File.path,
        contentType: MediaType('application', 'mp4'),
      ),
    );

    request.send().then((r) async {
      print(r.statusCode);

      if (r.statusCode == 200) {
        // print((json.decode(await r.stream.transform(utf8.decoder).join())).runtimeType);
        var result = json.decode(await r.stream.transform(utf8.decoder).join());
        print("--------------------------------");
        print(result);
        grade = result[1];
        _saveImages(result);
        setState(() {
          links = result[0];

        });
        loadVideoPlayer();
        print(links[0][0]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: links != null
          ? Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: links.length,
              itemBuilder: (BuildContext context, int index) {
                return ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    Text(
                      'Video 1',
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                    child: Column(
                      children:[
                        AspectRatio(
                        aspectRatio: controller1.value.aspectRatio,
                        child: VideoPlayer(controller1),
                      ),
      
                      Container( //duration of video
                        child: Text("Total Duration: " + controller1.value.duration.toString()),
                      ),
      
                      Container(
                          child: VideoProgressIndicator(
                              controller1,
                              allowScrubbing: true,
                              colors:VideoProgressColors(
                                backgroundColor: Colors.redAccent,
                                playedColor: Colors.green,
                                bufferedColor: Colors.purple,
                              )
                          )
                      ),
                      Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: (){
                                if(controller1.value.isPlaying){
                                  controller1.pause();
                                }else{
                                  controller1.play();
                                }

                                setState(() {

                                });
                              },
                              icon:Icon(controller1.value.isPlaying?Icons.pause:Icons.play_arrow)
                          ),

                          IconButton(
                              onPressed: (){
                                controller1.seekTo(Duration(seconds: 0));

                                setState(() {

                                });
                              },
                              icon:Icon(Icons.stop)
                          )
                        ],
                      ),
                    ),
                    ]
                    )
                    ),
                    
                    Text(
                      'Video 2',
                      style: TextStyle(fontSize: 20),
                    ),Container(
                    child: Column(
                      children:[
                        AspectRatio(
                        aspectRatio: controller2.value.aspectRatio,
                        child: VideoPlayer(controller2),
                      ),
      
                      Container( //duration of video
                        child: Text("Total Duration: " + controller1.value.duration.toString()),
                      ),
      
                      Container(
                          child: VideoProgressIndicator(
                              controller2,
                              allowScrubbing: true,
                              colors:VideoProgressColors(
                                backgroundColor: Colors.redAccent,
                                playedColor: Colors.green,
                                bufferedColor: Colors.purple,
                              )
                          )
                      ),
                      Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: (){
                                if(controller2.value.isPlaying){
                                  controller2.pause();
                                }else{
                                  controller2.play();
                                }

                                setState(() {

                                });
                              },
                              icon:Icon(controller2.value.isPlaying?Icons.pause:Icons.play_arrow)
                          ),

                          IconButton(
                              onPressed: (){
                                controller2.seekTo(Duration(seconds: 0));

                                setState(() {

                                });
                              },
                              icon:Icon(Icons.stop)
                          )
                        ],
                      ),
                    ),
                    ]
                    )
                    ),
                    Text(
                      'Your grade is: $grade',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
            ),
          ))
          : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Analyzing videos'),
              ),

            ],
          )),
    );
  }
}