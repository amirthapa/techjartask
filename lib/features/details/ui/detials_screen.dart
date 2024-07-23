import 'package:flutter/material.dart';
import 'package:techjartask/core/base/base_screen.dart';
import 'package:techjartask/core/base/base_state.dart';

class DetailsScreen extends BaseScreen {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends BaseState<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
