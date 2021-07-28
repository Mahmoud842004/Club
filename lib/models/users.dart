
class Users {
  final String id;
  final String name;
  final String profileimage;
  final String backgroundimage;
  final bool isonline;
  final List stories;
  final List following;
  final List followers;
  final List posts;

  Users({
    required this.id,
    required this.name,
    required this.profileimage,
    required this.backgroundimage,
    required this.isonline,
    required this.stories,
    required this.followers,
    required this.following,
    required this.posts,
  });
}
