import 'package:app_mmobx_login/screens/login_screen.dart';
import 'package:app_mmobx_login/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Tarefas",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 32),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                      },
                      icon: const Icon(Icons.exit_to_app))
                ],
              ),
            ),
            Expanded(
                child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    CustomTextField(),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                        child: ListView.separated(
                            itemBuilder: (_, index) {
                              return ListTile(
                                title: Text("item $index"),
                                onTap: () {},
                              );
                            },
                            separatorBuilder: (_, __) {
                              return const Divider();
                            },
                            itemCount: 10))
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
