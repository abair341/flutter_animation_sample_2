import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller1, _controller2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller1 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2200));
    _controller2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    _animation = new Tween(begin: 0.5, end: 1.0).animate(
      new CurvedAnimation(
        parent: _controller2,
        curve: Curves.easeInOut,
      ),
    );

    _controller1.repeat();
    _controller2.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Rotation"),
      ),
      body: Container(
        child: _getContent(),
      ),
    );
  }

  Widget _getContent() {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Opacity(
          opacity: _animation.value,
          child: Image(
            fit: BoxFit.fitWidth,
            image: AssetImage("assets/download.jpg"),
          ),
        ),
        new Container(
          child: _radialplaymenu(),
        ),
      ],
    );
  }

  Widget _radialplaymenu() {
    return Center(
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            bottom: 240.0,
            right: 180.0,
            child: ScaleTransition(
              scale: _controller1,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      image: AssetImage("assets/abair.jpg"),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
