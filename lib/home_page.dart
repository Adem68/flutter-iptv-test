import 'package:flutter/material.dart';
import 'package:iptv/video_player_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Channel> channels = [
    Channel('TRT Haber', 'https://tv-trthaber.live.trt.com.tr/master.m3u8',
        'https://trtkurumsal.trt.net.tr/Uploads/image/png/2020-10-13-20.48.21/22a73f58e06e4979827002c9463e196d.png'),
    Channel('TRT SPOR', 'https://tv-trtspor1.live.trt.com.tr/master.m3u8',
        'https://trtkurumsal.trt.net.tr/Uploads/image/png/2019-03-20-11.23.47/26a2ed090ada4b9fba97b3fcab3551d7.png'),
    Channel('NR1 TÜRK', 'https://n10101m.mediatriple.net/videoonlylive/mtkgeuihrlfwlive/broadcast_5c9e187770143.smil/playlist.m3u8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Nr1_logo_vector.svg/1200px-Nr1_logo_vector.svg.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IPTV Test'),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Kanallar',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 20),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: channels.length,
              itemBuilder: (BuildContext context, int index) {
                var item = channels[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VideoPlayerPage(item.title, item.streamUrl, item.imgUrl)),
                    );
                  },
                  leading: Image.network(
                    item.imgUrl,
                    width: 200,
                    height: 50,
                    scale: 0.5,
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Channel {
  final String title;
  final String streamUrl;
  final String imgUrl;

  Channel(this.title, this.streamUrl, this.imgUrl);
}
