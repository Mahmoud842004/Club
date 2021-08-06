class Users {
  final String id;
  final String name;
  final String? profileimage;
  final String? backgroundimage;
  final bool isonline;
  final List stories;
  final List posts;
  final List savedposts;

  factory Users.fromMap({required Map<String, dynamic>? map,required String id}) {
    return Users(
      id: id,
      name: map!['name'],
      posts: map['posts'],
      backgroundimage: map['background image'],
      profileimage: map['profile image'],
      isonline: map['is online'],
      savedposts: map['saved posts'],
      stories: map['stories'],
    );
  }

  Users({
    required this.id,
    required this.name,
    required this.profileimage,
    required this.backgroundimage,
    required this.isonline,
    required this.stories,
    required this.posts,
    required this.savedposts,
  });
}
