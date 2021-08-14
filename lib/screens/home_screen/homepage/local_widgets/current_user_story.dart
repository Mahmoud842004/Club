import 'package:club/models/screendata.dart';
import 'package:club/models/users.dart';
import 'package:club/screens/home_screen/homepage/local_widgets/animated_story.dart';
import 'package:club/screens/home_screen/homepage/local_widgets/camera_buttomsheat.dart';
import 'package:club/screens/home_screen/homepage/local_widgets/local_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentUserStory extends StatelessWidget {
  final ScreenData screendata;
  CurrentUserStory({required this.screendata});

  @override
  Widget build(BuildContext context) {
    Users? user = Provider.of<Users?>(context);
    if (user == null) {
      return AnimatedStory();
    } else if (user.stories.isEmpty) {
      return StoryWidget.currentuser(
        user: user,
        screendata: screendata,
        laststory: null,
        ontap: () => showModalBottomSheet(
          context: context,
          builder: (context) {
            return CameraButtomSheat();
          },
        ),
      );
    } else {
      return CurrentUserStoryAvatar(user: user, screendata: screendata);
    }
  }
}
