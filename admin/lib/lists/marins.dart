import 'package:admin/controllers/marinsController.dart';
import 'package:admin/models/marinModel.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:admin/widgets/marinWidgets.dart';
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
                        child: SingleChildScrollView(
                          child: Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            direction: Axis.horizontal,
                            runSpacing: 20,
                            spacing: 20,
                            children: snapshot.data!.docs
                                .map((item) => MarinPreview(item.data()))
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
