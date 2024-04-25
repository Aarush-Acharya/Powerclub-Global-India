import 'package:flutter/material.dart';
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
          bool isDesktop = MediaQuery.of(context).size.width > 1168;
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          image,
                          fit: BoxFit.fitWidth,
                          width: 1440,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15),
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
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            content,
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
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
