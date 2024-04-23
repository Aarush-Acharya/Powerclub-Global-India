import 'package:flutter/material.dart';

class BlogBox extends StatelessWidget {
  const BlogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.contain,
            child: Container(
              height: 400,
              width: 600,
              color: Colors.grey[300],
              child: Center(
                child: Text('Blog Post'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Industry Tag",
            style: TextStyle(fontSize: 14, color: Colors.amber),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Sample Title",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "This is a brief description written longer to test how it acts if its long",
            softWrap: true,
            style: TextStyle(
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
