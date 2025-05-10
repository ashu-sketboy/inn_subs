import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inn_subs/core/widgets/custom_text_field.dart';
import 'package:inn_subs/features/my_subscriptions/domain/bloc/my_subs_bloc.dart';

class AddCategoryScreen extends StatelessWidget {
  const AddCategoryScreen({super.key, required this.bloc});

  final MySubsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(value: bloc, child: _AddCategoryScreen());
  }
}

class _AddCategoryScreen extends StatefulWidget {
  const _AddCategoryScreen({super.key});

  @override
  State<_AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<_AddCategoryScreen> {
  @override
  void initState() {
    MySubsBloc bloc = BlocProvider.of<MySubsBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MySubsBloc, MySubsState>(
      builder: (context, state) {
        return Column(
          spacing: 12,
          children: [
            Text("Add a category", style: TextStyle(color: Colors.white)),
            CustomTextField.outlineBorder(),
            Text(
              "Select subscriptions",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Expanded(child: ListView.builder(
            //   itemCount:, itemBuilder: (context, index) {
            //     return SubsSelectionTile(subscription: subscription, idx: idx, onTap: onTap);
            // },),),
          ],
        );
      },
    );
  }
}
