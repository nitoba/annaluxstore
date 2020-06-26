import 'package:annaluxstore/app/modules/profile/components/text_form_widget.dart';
import 'package:annaluxstore/app/modules/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:asuka/asuka.dart' as asuka;

class UserInfo extends StatelessWidget {
  final ProfileController controller;

  const UserInfo({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            alignment: Alignment.topLeft,
            child: Text(
              "Informações do usuário",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                Observer(builder: (_) {
                  if (controller.user != null) {
                    return Column(
                      children: [
                        ...ListTile.divideTiles(
                          color: Colors.grey,
                          tiles: [
                            ListTile(
                              leading: Icon(Icons.email),
                              title: Text("Email"),
                              subtitle: Text(controller.user.email),
                            ),
                            if (controller.userAdress == null)
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                leading: Icon(Icons.my_location),
                                title: Text("Endereço"),
                                subtitle: Text("Toque aqui para adicionar"),
                                onTap: () {
                                  asuka.showDialog(
                                    builder: (context) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      title: Text("Infome o seu CEP"),
                                      content: Container(
                                        child: Location(
                                          controller: controller,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                          ],
                        ),
                        if (controller.userAdress != null) ...[
                          SizedBox(height: 12),
                          Text(
                            "Endereço",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.home),
                            title: Text("Bairro"),
                            subtitle: Text(controller.userAdress.bairro),
                          ),
                          ListTile(
                            leading: Icon(Icons.hotel),
                            title: Text("Lagradouro"),
                            subtitle: Text(controller.userAdress.logradouro),
                          ),
                          ListTile(
                            leading: Icon(Icons.comment),
                            title: Text("Complemento"),
                            subtitle: Text(controller.userAdress.complemento),
                          ),
                          ListTile(
                            leading: Icon(Icons.local_post_office),
                            title: Text("CEP"),
                            subtitle: Text(controller.userAdress.cep),
                          ),
                        ]
                      ],
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
