import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video"),
      ),
      body: VideoWidget(),
    );
  }
}

class VideoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VideoWidgetState();
  }
}

class _VideoWidgetState extends State<VideoWidget> {
  final playlistConfig = BetterPlayerPlaylistConfiguration(
      loopVideos: false, nextVideoDelay: Duration(milliseconds: 0));
  final playerConfig = BetterPlayerConfiguration(
      autoPlay: true,
      allowedScreenSleep: false,
      aspectRatio: 1280 / 720,
      controlsConfiguration: BetterPlayerControlsConfiguration(
          showControlsOnInitialize: false,
          enableOverflowMenu: false,
          enableSkips: false),
      placeholder: SizedBox.expand(
        child: Image(
          image: BlurHashImage('LBAdAqof00WCqZj[PDay0.WB}pof'),
          fit: BoxFit.cover,
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BetterPlayerPlaylist(
        betterPlayerDataSourceList: createDataSet(),
        betterPlayerPlaylistConfiguration: playlistConfig,
        betterPlayerConfiguration: playerConfig,
      ),
    );
  }

  List<BetterPlayerDataSource> createDataSet() => [
        BetterPlayerDataSource(
          BetterPlayerDataSourceType.network,
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
        ),
        BetterPlayerDataSource(BetterPlayerDataSourceType.network,
            'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4'),
        BetterPlayerDataSource(BetterPlayerDataSourceType.network,
            'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4'),
      ];
}
