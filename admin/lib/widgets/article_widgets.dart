import 'package:admin/controllers/articles_controller.dart';
import 'package:admin/models/article_model.dart';
import 'package:admin/resources/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:get/get.dart';

class ArticlePreview extends StatelessWidget {
  const ArticlePreview(this.article, {super.key});

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
        child: SizedBox(
          height: 500,
          width: context.width * 0.8,
          child: Column(
            children: [
              SizedBox(
                //height: 100,
                width: context.width * 0.8,
                child: OutlinedButton(
                  onPressed: null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        article.title,
                        textScaler: const TextScaler.linear(1.5),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        article.date,
                        textScaler: const TextScaler.linear(0.8),
                      ),
                    ],
                  ),
                ),
              ),
              Image.network(
                article.thumbnail,
                height: 400,
                width: context.width * 0.75,
              ),
            ],
          ),
        ));
  }
}

class ArticleInfo extends StatelessWidget {
  const ArticleInfo(this.article, this.controller, {super.key});

  final Article article;
  final ArticlesController controller;

  @override
  Widget build(BuildContext context) {
    final content = article.content;
    return ListView(shrinkWrap: true, children: [
      SizedBox(width: context.width, height: 20),
      SizedBox(
        width: context.width,
        height: 100,
        child: OutlinedButton(
          child: ListTile(
            trailing: const SizedBox(width: 100, child: Text('العنوان')),
            title: Text(
              article.title,
              maxLines: 3,
              textScaler: const TextScaler.linear(1.5),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          ),
          onPressed: () {
            controller.getListTile(article.title, "تم نسخ العنوان ");
          },
        ),
      ),
      SizedBox(width: context.width, height: 20),
      SizedBox(
        width: context.width,
        height: 50,
        child: OutlinedButton(
          child: ListTile(
            trailing: const SizedBox(width: 100, child: Text('التاريخ')),
            title: Text(
              article.date,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          onPressed: () {
            controller.getListTile(article.date, "تم نسخ التاريخ ");
          },
        ),
      ),
      SizedBox(width: context.width, height: 20),
      SizedBox(
        width: context.width,
        height: context.height * 0.7,
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
      SizedBox(width: context.width, height: 20),
      SizedBox(
          width: context.width,
          child: OutlinedButton(
            onPressed: null,
            child: HtmlWidget(
              content,
            ),
          ))
    ]);
  }
}
