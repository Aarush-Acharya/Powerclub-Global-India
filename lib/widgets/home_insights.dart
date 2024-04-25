import 'package:flutter/material.dart';
import 'package:pcg/change_notifiers/blog_notifier.dart';
import 'package:pcg/widgets/blog_box.dart';

class InsightsSection extends StatelessWidget {
  const InsightsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "Industry Insights",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ListenableBuilder(
            listenable: blogNotifier,
            builder: (context, child) {
              return blogNotifier.areBlogsFetched? isDesktop
                  ?  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlogBox(title: blogNotifier.blogs[0].data["title"],description: blogNotifier.blogs[0].data["description"],image: blogNotifier.blogs[0].data["thumbnail"], tag: blogNotifier.blogs[0].data["tag"], content: blogNotifier.blogs[0].data["content"],), // Assuming BlogBox is a widget you've defined
                        SizedBox(width: 30),
                        BlogBox(title: blogNotifier.blogs[0].data["title"],description: blogNotifier.blogs[0].data["description"],image: blogNotifier.blogs[0].data["thumbnail"], tag: blogNotifier.blogs[0].data["tag"], content: blogNotifier.blogs[0].data["content"],),
                      ],
                    )
                  : const Column(
                      children: [
                        BlogBox(title: "Sample Title",description: "This is a brief description written longer to test how it acts if its long",image: "assets/sample_image.jpeg", tag: "Industry Tag", content: "This is Sample content its written in a way to test how this acts if the Text is Long and screen is short",),
                        SizedBox(height: 16),
                        BlogBox(title: "Sample Title",description: "This is a brief description written longer to test how it acts if its long",image: "assets/sample_image.jpeg", tag: "Industry Tag", content: "This is Sample content its written in a way to test how this acts if the Text is Long and screen is short",),
                      ],
                    ): Center(child: CircularProgressIndicator(),);
            }
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Define what happens when the button is pressed
              // For example, navigate to a page showing client results
              Navigator.of(context)
                  .pushNamed('/insightsPage'); // Adjust the route as needed
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFFB4914C), // Background color of the button
              foregroundColor: Colors.white, // Text color of the button
            ),
            child: const Text('See our Insights'),
          ),
        ],
      ),
    );
  }
}
