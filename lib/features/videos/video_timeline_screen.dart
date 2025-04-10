import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widget/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemcount = 4;
  final PageController _pageController = PageController();
  final Duration _scrollDuration = Duration(milliseconds: 250);
  final Curve _scrollCurves = Curves.linear;

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurves,
    );
    if (page == _itemcount - 1) {
      _itemcount = _itemcount + 4;
      setState(() {});
    }
  }

  void _onVideoFinished() {
    return;
    _pageController.nextPage(duration: _scrollDuration, curve: _scrollCurves);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      displacement: 50,
      edgeOffset: 20,
      color: Theme.of(context).primaryColor,
      child: PageView.builder(
        onPageChanged: _onPageChanged,
        scrollDirection: Axis.vertical,
        itemCount: _itemcount,
        controller: _pageController,
        itemBuilder:
            (context, index) => VideoPost(
              onVideoFinished: _onVideoFinished,
              index: index, // Pass the index to VideoPost
            ), // Pass the index to VideoPost
      ),
    );
  }
}
