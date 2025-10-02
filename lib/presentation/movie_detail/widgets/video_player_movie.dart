import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class VideoPlayerMovie extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerMovie({super.key, required this.videoUrl});

  @override
  State<VideoPlayerMovie> createState() => _VideoPlayerMovieState();
}

class _VideoPlayerMovieState extends State<VideoPlayerMovie> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _initializePlayer(widget.videoUrl);
  }

  @override
  void didUpdateWidget(VideoPlayerMovie oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoUrl != widget.videoUrl) {
      _disposeControllers();
      _initializePlayer(widget.videoUrl);
    }
  }

  Future<void> _initializePlayer(String url) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final controller = VideoPlayerController.networkUrl(Uri.parse(url));
      await controller.initialize();

      final chewie = ChewieController(
        videoPlayerController: controller,
        autoPlay: true,
        looping: false,
        allowedScreenSleep: false,
      );

      controller.addListener(() {
        if (controller.value.isPlaying) {
          WakelockPlus.enable();
        } else {
          WakelockPlus.disable();
        }
      });

      setState(() {
        _videoPlayerController = controller;
        _chewieController = chewie;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _disposeControllers() {
    _chewieController?.dispose();
    _videoPlayerController?.dispose();
    _chewieController = null;
    _videoPlayerController = null;
    WakelockPlus.disable();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: Container(
          width: double.infinity,
          height: 200.0,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      );
    }

    if (_error != null) {
      return Container(
        width: double.infinity,
        height: 200.0,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            S.current.unknownError,
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(8.0),
        bottomRight: Radius.circular(8.0),
      ),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Chewie(controller: _chewieController!),
      ),
    );
  }
}
