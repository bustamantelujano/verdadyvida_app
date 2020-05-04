class Video {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String channelTitle;

  Video({
    this.id,
    this.title,
    this.thumbnailUrl,
    this.channelTitle,
  });

  factory Video.fromMap(Map<String, dynamic> snippet) {
    print(snippet);
    return Video(
      id: snippet['resourceId']['videoId'],
      title: snippet['title'],
      thumbnailUrl: snippet['thumbnails']['high']['url'],
      channelTitle: snippet['channelTitle'],
    );
  }
}

//{default: 
// {url: https://i.ytimg.com/vi/V3yvV2q6uCQ/default.jpg, width: 120, height: 90}, 
//     medium: {url: https://i.ytimg.com/vi/V3yvV2q6uCQ/mqdefault.jpg, width: 320, height: 180}, 
//     high: {url: https://i.ytimg.com/vi/V3yvV2q6uCQ/hqdefault.jpg, width: 480, height: 360}, 
//     standard: {url: https://i.ytimg.com/vi/V3yvV2q6uCQ/sddefault.jpg, width: 640, height: 480}, 
//     maxres: {url: https://i.ytimg.com/vi/V3yvV2q6uCQ/maxresdefault.jpg, width: 1280, height: 720}}