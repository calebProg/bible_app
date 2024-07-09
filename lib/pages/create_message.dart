import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class CreateMessage extends StatefulWidget {
  const CreateMessage({super.key});

  @override
  _CreateMessageState createState() => _CreateMessageState();
}

class _CreateMessageState extends State<CreateMessage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _referenceController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final String _currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  void dispose() {
    _topicController.dispose();
    _referenceController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final topic = _topicController.text;
      final reference = _referenceController.text;
      final message = _messageController.text;
      final date = _currentDate;

      print('Topic: $topic');
      print('Reference: $reference');
      print('Message: $message');
      print('Date: $date');

      // Clear the form
      _topicController.clear();
      _referenceController.clear();
      _messageController.clear();

      // Optionally show a snackbar or a dialog
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message created!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Message'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _topicController,
                decoration: const InputDecoration(labelText: 'Topic'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a topic';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _referenceController,
                decoration: const InputDecoration(labelText: 'Reference'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a reference';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(labelText: 'Message'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a message';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Date: $_currentDate',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
