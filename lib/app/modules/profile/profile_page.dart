import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'components/profile_header_widget.dart';
import 'components/user_info_widget.dart';
import 'profile_controller.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({Key key, this.title = "Profile"}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, ProfileController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          MaterialButton(
            color: thirdColor,
            shape: CircleBorder(),
            elevation: 5,
            child: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () async {
              await controller.logout();
              Modular.to.pushReplacementNamed("/");
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Observer(builder: (_) {
          if (controller.user != null) {
            return Column(
              children: <Widget>[
                ProfileHeader(
                  avatar: CachedNetworkImageProvider(controller.user.photoUrl),
                  coverImage: AssetImage('assets/images/logo.png'),
                  title: controller.user.name,
                  subtitle: "Usuário",
                ),
                const SizedBox(height: 10.0),
                UserInfo(
                  controller: controller,
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}
