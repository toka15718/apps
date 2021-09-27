class Photos {
  int _albumId;
  int _id;
  String _title;
  String _url;
  String _thumbnailUrl;

  Photos.fromJson(Map<String, dynamic> json) {
    _albumId = json['albumId'];
    _id = json['id'];
    _title = json['title'];
    _url = json['url'];
    _thumbnailUrl = json['thumbnailUrl'];
  }
  get albumId => _albumId;
  get id => _id;
  get title => _title;
  get url => _url;
  get thumbnailUrl => _thumbnailUrl;

}
