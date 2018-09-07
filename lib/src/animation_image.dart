import 'package:flutter/widgets.dart';
import 'dart:async';

const Duration defaultIntervalDuration = Duration(milliseconds: 100); //0.1s between two frame

class AnimationImage extends StatefulWidget {
  AnimationImage({
    this.assets,
    this.images,
    this.intervalDuration = defaultIntervalDuration, 
    this.repeat = false
    }): assert((assets != null && assets.length > 0) || (images != null && images.length > 0)),
        length = (images != null && images.length > 0) ? images.length : assets.length;

  final List<String> assets;
  final List<Image> images;
  final int length;
  final Duration intervalDuration;
  final bool repeat;

  @override
  State<StatefulWidget> createState() {
      // TODO: implement createState
      return new _AnimationImageState();
    }
}

class _AnimationImageState extends State<AnimationImage> {
  List<Image> _images;
  Timer _timer;
  int _frameIndex = 0;

  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      _init();
    }
  
  @override
  void didUpdateWidget(AnimationImage oldWidget) {
      // TODO: implement didUpdateWidget
      super.didUpdateWidget(oldWidget);
      if (_timer != null) {
        _timer.cancel();
      }
      _init();
    }

  @override

  @override
  void dispose() {
      // TODO: implement dispose
      if (_timer != null) {
        _timer.cancel();
      }
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
      // TODO: implement build
      if (_images[_frameIndex] == null) {
        _images[_frameIndex] = Image.asset(widget.assets[_frameIndex]);
      }
      return _images[_frameIndex];
    }
  
  void _timeoutHandler(Timer timer) {
    _frameIndex = (++_frameIndex) % widget.length;
    if (!widget.repeat && _frameIndex == 0) {
      _timer.cancel();
    } else {
      setState(() {

        });
    }
  }

  void _init() {
    _images = new List(widget.length);
    if (widget.images != null && widget.images.length == widget.length) {
      for (int i = 0; i < widget.length; ++i) {
        _images[i] = widget.images[i];
      }
    }
    _frameIndex = 0;
    _timer = Timer.periodic(widget.intervalDuration, _timeoutHandler);
  }
}