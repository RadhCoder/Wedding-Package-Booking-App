import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../authentication/register_page.dart';
import '../authentication/login_page.dart';
import '../package/wedding_package.dart';

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wedding Booking',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WeddingBookingHomePage(),
    );
  }
}

class WeddingBookingHomePage extends StatefulWidget {
  @override
  _WeddingBookingHomePageState createState() => _WeddingBookingHomePageState();
}

class _WeddingBookingHomePageState extends State<WeddingBookingHomePage> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('lib/assets/weddingvd.mp4')
      ..initialize().then((_) {
        setState(() {}); // Ensure the first frame is shown after the video is initialized
        _videoController.setLooping(true); // Loop the video
        _videoController.play(); // Play the video automatically
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'lib/assets/wedding.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _videoController.value.isInitialized
                    ? Container(
                        width: 350, // Maintain the 16:9 aspect ratio (300 * 9 / 16)
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: VideoPlayer(_videoController),
                        ),
                      )
                    : CircularProgressIndicator(),
                SizedBox(height: 20),
                Text(
                  'HAZULIFAR',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  child: Text('REGISTER'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  child: Text('LOGIN'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WeddingPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  child: Text('Wedding Package'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
