import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniapp/screens/post_focus.dart';
import 'package:miniapp/services/database.dart';

import 'desc_post.dart';

class Post extends StatelessWidget {
  final String urlBackground;
  final String urlprofil;
  final String name;
  final String id;
  final String time;
  final String desc;
  final bool postFocus;
  const Post({
    Key? key,
    required this.urlBackground,
    required this.urlprofil,
    required this.name,
    required this.time,
    required this.desc,
    required this.postFocus,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: GestureDetector(
        onTap: (() {
          Get.to(PostFocus(
              id: id,
              urlBackground: urlBackground,
              urlprofil: urlprofil,
              name: name,
              time: time,
              desc: desc));
        }),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: Get.height * .5,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(urlBackground), fit: BoxFit.cover)),
            ),
            Positioned.fill(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      final action = CupertinoActionSheet(
                        message: const Text(
                          'Que souhaitez-vous faire ?',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        actions: <Widget>[
                          CupertinoActionSheetAction(
                            isDestructiveAction: true,
                            onPressed: () {
                              Get.back();
                              // signaler publi
                            },
                            child: const Text('Signaler cette publication'),
                          ),
                          CupertinoActionSheetAction(
                            isDestructiveAction: true,
                            onPressed: () async {
                              if (await Database().deletePost(id)) {
                                Get.back();
                              } else {
                                Get.snackbar(
                                  'Erreur',
                                  'Impossible de supprimer le post',
                                  backgroundColor: Colors.redAccent,
                                  colorText: Colors.white,
                                );
                              }
                            },
                            child: const Text('Supprimer la publication'),
                          )
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          child: const Text(
                            'Annuler',
                            style: TextStyle(color: Colors.blue),
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      );

                      showCupertinoModalPopup(
                          context: context, builder: (context) => action);
                    },
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    )),
              ),
            ),
            DescPost(
              desc: desc,
              name: name,
              time: time,
              urlprofil: urlprofil,
              postFocus: postFocus,
            ),
          ],
        ),
      ),
    );
  }
}
