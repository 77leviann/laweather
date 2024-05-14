import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function(
    String,
  ) onSubmitted;

  const CustomSearchBarWidget({
    required this.controller,
    required this.onSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      autocorrect: true,
      controller: controller,
      style: TextStyle(
        color: Theme.of(
          context,
        ).colorScheme.onPrimaryContainer,
      ),
      decoration: InputDecoration(
        filled: true,
        hintText: 'Search Location',
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        prefixIcon: IconButton(
          icon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            onSubmitted(controller.text);
          },
        ),
      ),
    );
  }
}
