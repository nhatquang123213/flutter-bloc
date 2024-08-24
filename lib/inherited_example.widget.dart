import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FamilyProvider extends InheritedWidget {
  final String name;
  const FamilyProvider({
    super.key,
    required super.child,
    required this.name,
  });

  @override
  bool updateShouldNotify(covariant FamilyProvider oldWidget) {
    return oldWidget.name != name;
  }
}

class Parent extends StatefulWidget {
  const Parent({Key? key}) : super(key: key);

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FamilyProvider(
          ///can change
          name: "Quang",
          child: ChildWidget(),
        ),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final familyProvider =
        context.dependOnInheritedWidgetOfExactType<FamilyProvider>();
    return Text(familyProvider?.name.toString() ?? "");
  }
}
