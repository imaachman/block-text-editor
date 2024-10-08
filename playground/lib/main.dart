import 'package:block_text_editor/block_text_editor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final controller = RichTextEditingController(text: 'Hello how are you?');

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 64),
                height: constraints.maxHeight,
                width: constraints.maxWidth / 1.5,
                child: RichTextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write something, or press \'/\' for commands...',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  maxLines: null,
                  selectionControls: SelectionToolbar(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
