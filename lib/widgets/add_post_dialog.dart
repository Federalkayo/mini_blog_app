import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AddPostDialog extends StatefulWidget {
  const AddPostDialog({super.key});

  @override
  State<AddPostDialog> createState() => _AddPostDialogState();
}

class _AddPostDialogState extends State<AddPostDialog> {

  final TextEditingController _tittleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  bool isLoading = false;

  Future<void> _submitPost() async {
  if (_tittleController.text.isEmpty ||
      _bodyController.text.isEmpty) {
    return;
  }

  setState(() => isLoading = true);

  try {
    await createPost(
      title: _tittleController.text,
      body: _bodyController.text,
      userId: 1, // Assuming a fixed user ID for simplicity
    );

    Navigator.pop(context, true); // success
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Failed to create post')),
    );
  } finally {
    setState(() => isLoading = false);
  }
}

 @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add now post'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _tittleController,
              decoration: InputDecoration(
                labelText: 'Title'
              ),
            ),
            SizedBox(height: 12,),

            TextField(
              controller: _bodyController,
              decoration: InputDecoration(
                labelText: 'Body of the post'
              ),
            ),
          ],
        ),
      ),

      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),

        ElevatedButton(
        onPressed: isLoading ? null : _submitPost,
        child: isLoading
            ? const SizedBox(
                height: 16,
                width: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Text('Submit'),
      ),
      ],
    );
  }
}