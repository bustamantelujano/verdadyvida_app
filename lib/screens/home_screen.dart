import 'package:flutter/material.dart';
import 'package:verdadyvida_app/models/channel_model.dart';
import 'package:verdadyvida_app/models/video_model.dart';
import 'package:verdadyvida_app/screens/video_screen.dart';
import 'package:verdadyvida_app/services/api_service.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Channel _channel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UCk7JB_piwUNzJO2OCjFZLnw');
    setState(() {
      _channel = channel;
    });
  }

  _buildLastVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(id: video.id),
        ),
      ),
      child: Container(
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.network(
            'https://img.youtube.com/vi/'+video.id+'/maxresdefault.jpg',
            fit: BoxFit.fill,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
        ),
      ),
    );
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(id: video.id),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        padding: EdgeInsets.all(10.0),
        height: 140.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),

          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0, 1),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image(
              width: 150.0,
              image: NetworkImage(
                'https://img.youtube.com/vi/'+video.id+'/maxresdefault.jpg',
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel.uploadPlaylistId);
    List<Video> allVideos = _channel.videos..addAll(moreVideos);
    setState(() {
      _channel.videos = allVideos;
    });
    _isLoading = false;
  }
  _serieA(numbers) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        height: MediaQuery.of(context).size.height * 0.15,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: numbers.length, itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.40,
                child: Card(
                  color: Colors.blue,
                  child: Container(
                    child: Center(child: Text(numbers[index].toString(), style: TextStyle(color: Colors.white, fontSize: 36.0),)),
                  ),
                ),
              );
        }),
        
      );
      
  }

  @override
  Widget build(BuildContext context) {
    final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];

    return Scaffold(
      body:
        Stack(
          children: <Widget>[
            Text(""),
              _channel != null ? 
              NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollDetails) {
                    if (!_isLoading &&
                        _channel.videos.length != int.parse(_channel.videoCount) &&
                        scrollDetails.metrics.pixels ==
                            scrollDetails.metrics.maxScrollExtent) {
                      _loadMoreVideos();
                    }
                    return false;
                  },
                  child: ListView.builder(
                    // scrollDirection: Axis.horizontal,

                    itemCount: 1+   _channel.videos.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return _buildLastVideo(_channel.videos[0]);
                      }
                      // if (index == 1) {
                      //   return _serieA(numbers);
                      // }
                      Video video = _channel.videos[index -1];
                      return _buildVideo(video);
                    },
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor, // Red
                    ),
                  ),
                ),


        ],
      )






      

     
    );
  }
}


