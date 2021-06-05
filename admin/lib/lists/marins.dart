import 'package:admin/controllers/marinsController.dart';
import 'package:admin/models/marinModel.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Marins extends StatelessWidget {
  const Marins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "القوارب",
      subtitle: Text("قاعدة بيانات القوارب"),
      child: GetBuilder<MarinsController>(
        init: MarinsController(),
        builder: (b) {
          return FutureBuilder<QuerySnapshot<Marin>>(
              future: b.getMarins(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }

                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.done)
                  return Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          direction: Axis.horizontal,
                          children: snapshot.data!.docs
                              .map((item) => MarinPreview(item.data()))
                              .toList()
                              .cast<Widget>(),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  );
                return const Center(child: CircularProgressIndicator());
              });
        },
      ),
    );
  }
}

class MarinPreview extends StatelessWidget {
  MarinPreview(this.marin);

  final Marin marin;

  Widget get details {
    return OutlinedButton(
      onPressed: () {
        final String id = marin.marinReference.replaceAll('/', '-');
        Get.toNamed(
          "/Seaman?id=$id",
        );
      },
      child: ListTile(
        leading: reference,
        title: name,
      ),
    );
  }

  Widget get name {
    return Text(
      '${marin.marinLastName} ${marin.marinFirstName}',
      textScaleFactor: 1.3,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  Widget get reference {
    return SizedBox(
      width: 70,
      child: Center(
        child: Text(
          '${marin.marinReference}',
          textScaleFactor: 0.8,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: details,
      width: 300,
      height: 100,
    );
  }
}
