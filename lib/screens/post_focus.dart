import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/database.dart';
import '../widgets/desc_post.dart';

class PostFocus extends StatelessWidget {
  final String urlBackground;
  final String urlprofil;
  final String name;
  final String id;
  final String time;
  final String desc;
  const PostFocus(
      {Key? key,
      required this.urlBackground,
      required this.urlprofil,
      required this.name,
      required this.time,
      required this.desc,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(urlBackground), fit: BoxFit.cover)),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(24.0),
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.2),
                      shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(24.0),
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.2),
                      shape: BoxShape.circle),
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
            ),
          ),
          FittedBox(
            child: DescPost(
              desc: desc,
              name: name,
              time: time,
              urlprofil: urlprofil,
              postFocus: true,
            ),
          ),
        ],
      ),
    );
  }
}
