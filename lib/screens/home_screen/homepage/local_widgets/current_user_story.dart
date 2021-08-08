import 'package:club/models/screendata.dart';
import 'package:club/models/users.dart';
import 'package:club/screens/home_screen/homepage/local_widgets/animated_story.dart';
import 'package:club/screens/home_screen/homepage/local_widgets/local_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentUserStory extends StatelessWidget {
  final ScreenData screendata;
  final String userid;
  CurrentUserStory({required this.screendata, required this.userid});

  @override
  Widget build(BuildContext context) {
    Users? user = Provider.of<Users?>(context);
    if (user == null) {
      return AnimatedStory();
    } else {
      return CurrentUserStoryAvatar(user: user, screendata: screendata);
    }
  }
}
