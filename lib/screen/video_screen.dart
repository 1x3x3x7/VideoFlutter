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
          'https://vod-progressive.akamaized.net/exp=1623025993~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F4204%2F16%2F421020269%2F1819002288.mp4~hmac=7d3a1103824d863f13b6701fd2af6ca07f3ef93e9197ee3c5a214299f5d87ab6/vimeo-prod-skyfire-std-us/01/4204/16/421020269/1819002288.mp4?filename=Cycling+-+39183.mp4',
        ),
        BetterPlayerDataSource(BetterPlayerDataSourceType.network,
            'https://vod-progressive.akamaized.net/exp=1623026800~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F4973%2F14%2F374868332%2F1561932694.mp4~hmac=2b5f235f0a26c72339661cc6ba7ee7a9873005ea3000b8b157ac93fd6dab5780/vimeo-prod-skyfire-std-us/01/4973/14/374868332/1561932694.mp4?filename=Bodybuilding+-+29328.mp4'),
        BetterPlayerDataSource(BetterPlayerDataSourceType.network,
            'https://vod-progressive.akamaized.net/exp=1623026827~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F2436%2F18%2F462182255%2F2046344646.mp4~hmac=6cbc205374d7870415297cf7cf066a8470ddeec1a1bde5f6603cd4ab795c6577/vimeo-prod-skyfire-std-us/01/2436/18/462182255/2046344646.mp4?filename=Workout+-+50888.mp4'),
      ];
}
