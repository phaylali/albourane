import 'package:admin/controllers/boatsController.dart';
import 'package:admin/models/boatModel.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Boats extends StatelessWidget {
  const Boats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "القوارب",
      subtitle: Text("قاعدة بيانات القوارب"),
      child: GetBuilder<BoatsController>(
        init: BoatsController(),
        builder: (b) {
          return FutureBuilder<QuerySnapshot<Boat>>(
              future: b.getBoats(),
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
                        child: SingleChildScrollView(
                          child: Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            direction: Axis.horizontal,
                            spacing: 20,
                            runSpacing: 20,
                            children: snapshot.data!.docs
                                .map((item) => BoatPreview(item.data()))
                                .toList()
                                .cast<Widget>(),
                          ),
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

class BoatPreview extends StatelessWidget {
  BoatPreview(this.boat);

  final Boat boat;

  Widget get details {
    return OutlinedButton(
      onPressed: () {
        final String id = boat.boatReference.replaceAll('/', '-');
        Get.toNamed(
          "/Boat?id=$id",
        );
      },
      child: ListTile(
        leading: reference,
        title: name,
        subtitle: owner,
      ),
    );
  }

  Widget get name {
    return Text(
      '${boat.boatName}',
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
          '${boat.boatReference}',
          textScaleFactor: 0.8,
        ),
      ),
    );
  }

  Widget get owner {
    return Text(
      '${boat.boatOwner}',
      textScaleFactor: 0.75,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
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
