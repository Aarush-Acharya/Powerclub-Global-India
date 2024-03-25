import 'package:flutter/material.dart';

class HomeNewsletter extends StatefulWidget {
  const HomeNewsletter({Key? key}) : super(key: key);

  @override
  _HomeNewsletterState createState() => _HomeNewsletterState();
}

class _HomeNewsletterState extends State<HomeNewsletter> {
  final TextEditingController _emailController = TextEditingController();

  void _submit() {
    print('Submitted email: ${_emailController.text}');
    _emailController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Subscription successful!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFB4914C),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Adjust alignment
        children: [
          Text(
            "Subscribe to Powerclub Global Insights",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center, // Center align the text
          ),
          SizedBox(height: 8),
          Text(
            "Our monthly look into the critical challenges facing global businesses.",
            style: TextStyle(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.center, // Center align the text
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button color
                  foregroundColor: Color(0xFFB4914C), // Text color
                ),
                child: Text('Submit'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
