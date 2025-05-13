import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  final List<String> videoUrls = [
    "https://www.youtube.com/watch?v=9bZkp7q19f0",
    "https://www.youtube.com/watch?v=3JZ_D3ELwOQ",
    "https://www.youtube.com/watch?v=L_jWHffIx5E",
  ];

  late YoutubePlayerController _controller;
  int? _selectedVideoIndex;

  @override
  void initState() {
    super.initState();
    // Initialize with the first video by default
    _selectedVideoIndex = 0;
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrls[0])!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: false,
        enableCaption: true,
        isLive: false,
        forceHD: false,
        loop: false,
      ),
    );
  }

  void _playVideo(int index) {
    final videoId = YoutubePlayer.convertUrlToId(videoUrls[index]);
    if (videoId != null) {
      _controller.load(videoId);
      setState(() {
        _selectedVideoIndex = index;
      });
    }
  }

  void _openFullscreen(BuildContext context) {
    final videoId = YoutubePlayer.convertUrlToId(
      videoUrls[_selectedVideoIndex!],
    );
    if (videoId == null) return;

    final fullscreenController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (_) => Scaffold(
              backgroundColor: Colors.black,
              body: SafeArea(
                child: Stack(
                  children: [
                    Center(
                      child: YoutubePlayer(controller: fullscreenController),
                    ),
                    Positioned(
                      top: 24,
                      left: 16,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          fullscreenController.dispose();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_controller != null)
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              children: [
                YoutubePlayer(controller: _controller),
                Positioned(
                  right: 8,
                  top: 8,
                  child: IconButton(
                    icon: const Icon(Icons.fullscreen, color: Colors.white),
                    onPressed: () => _openFullscreen(context),
                  ),
                ),
              ],
            ),
          )
        else
          const SizedBox(height: 180),

        const SizedBox(height: 16),

        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: videoUrls.length,
            itemBuilder: (context, index) {
              final videoId = YoutubePlayer.convertUrlToId(videoUrls[index]);
              final thumbnail = 'https://img.youtube.com/vi/$videoId/0.jpg';

              return GestureDetector(
                onTap: () => _playVideo(index),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  width: 150,
                  child: Image.network(thumbnail, fit: BoxFit.cover),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
