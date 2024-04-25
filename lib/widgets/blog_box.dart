import 'package:flutter/material.dart';

class BlogBox extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  final String tag;
  final String description;
  const BlogBox(
      {Key? key,
      required this.image,
      required this.content,
      required this.description,
      required this.tag,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/blogs',
            arguments: {'image': image, 'title': title, 'content': content});
      },
      child: Ink(
        width: 600,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.contain,
                child: Ink(
                    height: 400,
                    width: 600,
                    color: Colors.grey[300],
                    child: Image.network(
                      image,
                      fit: BoxFit.contain,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                tag,
                style: const TextStyle(fontSize: 14, color: Colors.amber),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
