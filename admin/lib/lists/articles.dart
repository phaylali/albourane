import 'package:admin/controllers/articles_controller.dart';
import 'package:admin/models/article_model.dart';
import 'package:admin/widgets/article_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Articles extends GetView<ArticlesController> {
  const Articles({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot<Article>?>(
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
        if (snapshot.connectionState == ConnectionState.done) {
          return Wrap(
            alignment: WrapAlignment.spaceEvenly,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 20,
            spacing: 20,
            verticalDirection: VerticalDirection.up,
            children: snapshot.data!.docs
                .map((item) => ArticlePreview(item.data()))
                .toList()
                .cast<Widget>(),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
