import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../views/article_view.dart';

class NewsTile extends StatelessWidget {
  final String? imgUrl, title, desc, url;
  const NewsTile(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.desc,
      this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(newsUrl: url!),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imgUrl!,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(desc!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                )),
          ],
        ),
      ),
    );
  }
}
