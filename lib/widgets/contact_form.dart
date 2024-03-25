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
  String businessName = '';
  String message = '';
  String inquiryType = '';

  final List<String> inquiryTypes = [
    'Business Inquiry : Explore Retaining PcG',
    'Partnership Request : Request Emergence Partnership',
    'Press Request : Request Press Comments',
    'Speaking Request :  Request Expert Speaker',
    'Careers : Request Career Oportunities',
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
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
              'Contact Powerclub Global',
              style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Please Note that Due to a Large Volume of Inquiries we cannot Respond to Every Request. Thank you for Understanding.',
              style: TextStyle(fontSize: 14, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Inquiry Type',
              style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(labelText: 'Inquiry Type'),
              value: inquiryType.isNotEmpty ? inquiryType : null,
              onChanged: (String? newValue) {
                setState(() {
                  inquiryType = newValue!;
                });
              },
              items: inquiryTypes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              validator: (value) => value == null ? 'Please select an inquiry type' : null,
            ),
            const SizedBox(height: 20),
            const Text(
              'Contact Information',
              style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
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
            const SizedBox(height: 20),
            const Text(
              'Business Information',
              style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Business Name'),
              validator: (value) => value == null || value.isEmpty ? 'Please enter your business name' : null,
              onSaved: (value) => businessName = value ?? '',
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
                backgroundColor: Color(0xFFDCB62A), // Corrected background color
                foregroundColor: Colors.white, // Text color
                ),
            child: const Text('Submit'),
            ),
          ],
         ),
       ),
    );
  }
}
