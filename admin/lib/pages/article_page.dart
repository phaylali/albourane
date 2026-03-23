import 'package:admin/controllers/articles_controller.dart';
import 'package:admin/models/article_model.dart';
import 'package:admin/widgets/article_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticlePage extends GetView<ArticlesController> {
  final String id = Get.parameters['id']!;

  ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Article>?>(
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
    );
  }
}
