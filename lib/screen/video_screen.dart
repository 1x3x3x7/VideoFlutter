import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
  final _config = _Config();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) => afterBuild(context));
  }

  @override
  Widget build(BuildContext context) {
    var widget = Container(
      padding: EdgeInsets.only(top: 60),
      child: Stack(
        children: [
          BetterPlayerPlaylist(
            key: _config.betterPlayerPlaylistStateKey,
            betterPlayerDataSourceList: _config.dataSource,
            betterPlayerPlaylistConfiguration: _config.playlistConfig,
            betterPlayerConfiguration: _config.playerConfig,
          ),
          Container(
            margin: EdgeInsets.all(8),
            alignment: Alignment.topLeft,
            child: Text(
              "Exercise",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );

    return widget;
  }

  void afterBuild(BuildContext context) {
    _config.betterPlayerPlaylistController?.betterPlayerController
        ?.addEventsListener((event) {
      print("Better player event: ${event.betterPlayerEventType}");
      if (event.betterPlayerEventType == BetterPlayerEventType.finished) {
        if (_config.betterPlayerPlaylistController?.currentDataSourceIndex
                .toInt() ==
            0) {
          // _betterPlayerPlaylistController?.setupDataSource(0);
        }
      }
    });
  }
}

class _Config {
  final GlobalKey<BetterPlayerPlaylistState> betterPlayerPlaylistStateKey =
      GlobalKey();

  final playlistConfig = BetterPlayerPlaylistConfiguration(
      loopVideos: false, nextVideoDelay: Duration(milliseconds: 0));

  final playerConfig = BetterPlayerConfiguration(
    autoPlay: true,
    allowedScreenSleep: false,
    aspectRatio: 1280 / 720,
    controlsConfiguration:
        BetterPlayerControlsConfiguration(showControls: false),
  );

  final cacheConfig = const BetterPlayerCacheConfiguration(
      useCache: true,
      preCacheSize: 10 * 1024 * 1024,
      maxCacheSize: 10 * 1024 * 1024,
      maxCacheFileSize: 10 * 1024 * 1024);

  List<BetterPlayerDataSource> get dataSource => <BetterPlayerDataSource>[
        BetterPlayerDataSource(BetterPlayerDataSourceType.network,
            'http://192.168.1.69:8080/stream/hiit/master_plank.m3u8',
            cacheConfiguration: cacheConfig),
        BetterPlayerDataSource(BetterPlayerDataSourceType.network,
            'http://192.168.1.69:8080/stream/hiit/master_abs.m3u8',
            cacheConfiguration: cacheConfig)
      ];

  BetterPlayerPlaylistController? get betterPlayerPlaylistController =>
      betterPlayerPlaylistStateKey.currentState!.betterPlayerPlaylistController;
}
