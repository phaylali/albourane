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

                final data = snapshot.data;
                return Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Wrap(
                        children: snapshot.data!.docs
                            .map((item) => BoatItem(item.data()))
                            .toList()
                            .cast<Widget>(),
                      ),
/*
                      ListView.builder(
                          itemCount: data!.size,
                          itemBuilder: (context, index) {
                            if (data.docs.isNotEmpty)
                              return BoatItem(data.docs[index].data());
                            return const Center(
                                child: CircularProgressIndicator());
                          }),*/
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                );
              });
        },
      ),
    );
  }
}

class BoatItem extends StatelessWidget {
  BoatItem(this.boat);

  final Boat boat;

  Widget get details {
    return ListTile(
      leading: reference,
      title: name,
      subtitle: owner,
    );
  }

  Widget get name {
    return Text(
      '${boat.boatName}',
      textScaleFactor: 1.5,
    );
  }

  Widget get reference {
    return Text(
      '${boat.boatReference}',
    );
  }

  Widget get owner {
    return Text(
      '${boat.boatOwner}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return details;
  }
}
