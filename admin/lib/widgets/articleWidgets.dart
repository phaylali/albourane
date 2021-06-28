import 'package:admin/controllers/articlesController.dart';
import 'package:admin/models/articleModel.dart';
import 'package:admin/resources/icons.dart';
import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class ArticlePreview extends StatelessWidget {
  ArticlePreview(this.article);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          final String id = article.url;
          Get.toNamed(
            "/Article?id=$id",
          );
        },
        child: Stack(
          children: [
            Image.network(
              '${article.thumbnail}',
              height: 500,
              width: context.width * 0.8,
            ),
            SizedBox(
              height: 100,
              width: context.width * 0.8,
              child: Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    Text(
                      '${article.title}',
                      textScaleFactor: 1.2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    Text(
                      '${article.date}',
                      textScaleFactor: 0.8,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class ArticleInfo extends StatelessWidget {
  ArticleInfo(this.article, this.controller);

  final Article article;
  final ArticlesController controller;

  @override
  Widget build(BuildContext context) {
    final content = article.content;
    return ListView(children: [
      SizedBox(
        width: context.width,
        height: 100,
        child: OutlinedButton(
          child: ListTile(
            trailing: SizedBox(width: 50, child: Text('العنوان')),
            title: Text(
              article.title.isNotEmpty ? article.title : "لايوجد",
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
          onPressed: () {
            controller.getListTile(article.title, "تم نسخ العنوان ");
          },
        ),
      ),
      SizedBox(
        height: 20,
      ),
      SizedBox(
        width: context.width,
        height: 50,
        child: OutlinedButton(
          child: ListTile(
            trailing: SizedBox(width: 50, child: Text('تاريخ النشر')),
            title: Text(
              article.date.isNotEmpty ? article.date : "لايوجد",
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          onPressed: () {
            controller.getListTile(article.date, "تم نسخ التاريخ ");
          },
        ),
      ),
      SizedBox(
        height: 20,
      ),
      SizedBox(
        width: context.width,
        child: OutlinedButton(
          child: article.thumbnail.isNotEmpty
              ? Image.network(article.thumbnail)
              : OmniIcons().document,
          onPressed: () {
            Get.defaultDialog(
                title: 'كبر الصورة',
                content: InteractiveViewer(
                  child: Row(
                    children: [
                      Expanded(
                          child: Image.network(
                        article.thumbnail,
                        width: context.width * 0.8,
                        height: context.height * 0.7,
                      )),
                    ],
                  ),
                ));
          },
        ),
      ),
      SizedBox(
        height: 20,
      ),
      SizedBox(
          width: context.width,
          child: Html(
            data: """$content""",
          ))
    ]);
  }
}
