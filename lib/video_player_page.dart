import 'package:flutter/material.dart';
import 'package:yoyo_player/yoyo_player.dart';

class VideoPlayerPage extends StatefulWidget {
  final String title;
  final String streamUrl;
  final String imgUrl;

  VideoPlayerPage(this.title, this.streamUrl, this.imgUrl);

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  bool fullscreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fullscreen == false
          ? AppBar(
              title: Image(
                image: NetworkImage(widget.imgUrl),
                fit: BoxFit.fitHeight,
                height: 50,
              ),
              centerTitle: true,
            )
          : null,
      backgroundColor: Colors.black,
      body: Column(
        children: [
          YoYoPlayer(
            aspectRatio: 16 / 9,
            url: widget.streamUrl,
            videoStyle: VideoStyle(),
            videoLoadingStyle: VideoLoadingStyle(
              loading: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: NetworkImage(widget.imgUrl),
                      fit: BoxFit.fitHeight,
                      height: 50,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Yayın yükleniyor...",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            onfullscreen: (t) {
              if (this.mounted) {
                setState(() {
                  fullscreen = t;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
