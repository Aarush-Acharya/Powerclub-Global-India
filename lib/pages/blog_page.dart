import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:pcg/widgets/appbar.dart';
import 'package:pcg/widgets/drawer.dart';
import 'package:pcg/widgets/footer.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    ScrollController scrollController = ScrollController();
    // bool isDesktop = MediaQuery.sizeOf(context).width < ;
    dynamic args = ModalRoute.of(context)!.settings.arguments!;
    String image = args!["image"];
    String title = args!["title"];
    String content = args!["content"];
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          scaffoldKey: scaffoldKey,
        ),
      ),
      drawer: const CustomDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = MediaQuery.of(context).size.width > 786;
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 400,
                          child: Image.network(
                            image,
                            fit: BoxFit.contain,
                            width: 1440,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: isDesktop
                                  ? 0.2 * MediaQuery.sizeOf(context).width
                                  : 20,
                              vertical: 15),
                          child: Text(
                            title,
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: isDesktop
                                    ? 0.2 * MediaQuery.sizeOf(context).width
                                    : 40),
                            child: MarkdownBody(data: content)),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    )),
              ),
              const Footer(),
            ],
          );
        },
      ),
    );
  }
}
