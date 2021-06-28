import 'package:admin/controllers/articlesController.dart';
import 'package:admin/models/articleModel.dart';
import 'package:admin/widgets/articleWidgets.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Articles extends GetView<ArticlesController> {
  const Articles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "الاخبار و الانشطة",
      child: FutureBuilder<QuerySnapshot<Article>>(
        future: controller.getArticles(),
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
            return Wrap(
              alignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 20,
              spacing: 20,
              children: snapshot.data!.docs
                  .map((item) => ArticlePreview(item.data()))
                  .toList()
                  .cast<Widget>(),
            );
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
