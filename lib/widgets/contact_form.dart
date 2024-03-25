import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  ContactFormState createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  String email = '';
  String phoneNumber = '';
  String message = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Place your form submission logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Submission successful')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 120.0 : 20.0,
        vertical: 20.0,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Contact Us',
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'First Name'),
              validator: (value) => value == null || value.isEmpty ? 'Please enter your first name' : null,
              onSaved: (value) => firstName = value ?? '',
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Last Name'),
              validator: (value) => value == null || value.isEmpty ? 'Please enter your last name' : null,
              onSaved: (value) => lastName = value ?? '',
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) => value == null || !value.contains('@') ? 'Please enter a valid email' : null,
              onSaved: (value) => email = value ?? '',
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Phone Number'),
              validator: (value) => value == null || value.isEmpty ? 'Please enter your phone number' : null,
              onSaved: (value) => phoneNumber = value ?? '',
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Message'),
              maxLines: 4,
              validator: (value) => value == null || value.isEmpty ? 'Please enter your message' : null,
              onSaved: (value) => message = value ?? '',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDCB62A), 
                foregroundColor: Colors.white,
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
