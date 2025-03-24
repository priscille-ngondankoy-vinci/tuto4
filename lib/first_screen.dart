import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var nbClicks = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First screen"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Hello from first screen."),
            const SizedBox(height: 16),
            Text("There were $nbClicks clicks."),
            const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go("/second"),
            child: const Text("Go to second screen"),
          ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go("/second", extra: nbClicks),
              child: const Text("Go to second screen"),
            ),
          ],
        ),
      ),
    );
  }
}