class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  //generate dummy post
  static List<Post> generatePosts() {
    return List.generate(
      10,
      (index) => Post(
        id: index,
        title: 'Post Title $index',
        body: 'Post Body $index',
      ),
    );
  }
}
