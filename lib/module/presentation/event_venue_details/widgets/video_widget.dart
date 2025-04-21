// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoApp extends StatefulWidget {
//   const VideoApp({super.key});

//   @override
//   _VideoAppState createState() => _VideoAppState();
// }

// class _VideoAppState extends State<VideoApp> {
// late VideoPlayerController _controller;

// @override
// void initState() {
//   super.initState();
//   _controller = VideoPlayerController.networkUrl(Uri.parse(
//       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
//     ..initialize().then((_) {
//       setState(() {});
//     });
// }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Demo',
//       home: Scaffold(
//         body: Container(
// child: _controller.value.isInitialized
//     ? AspectRatio(
//         aspectRatio: _controller.value.aspectRatio,
//         child: VideoPlayer(_controller),
//       )
//     : Container(),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               _controller.value.isPlaying
//                   ? _controller.pause()
//                   : _controller.play();
//             });
//           },
//           child: Icon(
//             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        ),
      )
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    return Column(
      children: [
        Text('Video(1)', style: textTheme.bodySmall),
        Container(
          child:
              _controller.value.isInitialized
                  ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                  : Container(),
        ),
        ElevatedButton(onPressed: () {
          setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
        }, child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),),
        
      ],
    );
  }
}
