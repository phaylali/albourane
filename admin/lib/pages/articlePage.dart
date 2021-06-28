import 'package:admin/controllers/articlesController.dart';
import 'package:admin/models/articleModel.dart';
import 'package:admin/widgets/articleWidgets.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticlePage extends GetView<ArticlesController> {
  final String id = Get.parameters['id']!;

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "مقال",
      child: FutureBuilder<DocumentSnapshot<Article>>(
        future: controller.getArticle(id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return ArticleInfo(snapshot.data!.data()!, controller);
        },
      ),
    );
  }
}
