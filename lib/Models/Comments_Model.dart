class comments_Model {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  comments_Model(
      {this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  comments_Model.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['albumId'] = albumId;
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    return data;
  }
}
