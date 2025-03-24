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
              onPressed: () => setState(() => nbClicks++),
              child: const Text("click me"),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => context.go("/second", extra: nbClicks),
              child: const Text("go to second screen"),
            ),
            const SizedBox(height: 32),
            const Expanded(child: UserListView()),
          ],
        ),
      ),
    );
  }
}

class UserListView extends StatelessWidget {
  static const usernames = ['mcCain123', 'greg123', 'sarah123'];

  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usernames.length,
      itemBuilder: (context, index) {
        final username = usernames[index];
        return ListTile(
          title: Center(child: Text(username)),
          onTap: () => context.go('/users/$username'),
        );
      },
    );
  }
}