import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:inn_subs/core/helper/status/screen_status.dart';
import 'package:inn_subs/core/widgets/custom_text_field.dart';
import 'package:inn_subs/features/create_category/domain/bloc/category_bloc.dart';
import 'package:inn_subs/features/create_category/presentation/widget/subs_selection_tile.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscription/subscription.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscriptionCategory/subscription_category.dart';

class AddCategoryScreen extends StatelessWidget {
  final List<Subscription> mySubscriptions;
  final List<SubscriptionCategory> category;

  const AddCategoryScreen({
    super.key,
    required this.mySubscriptions,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => CategoryBloc(
            mySubscriptions: mySubscriptions,
            category: category,
          ),
      child: _AddCategoryScreen(),
    );
  }
}

class _AddCategoryScreen extends StatefulWidget {
  const _AddCategoryScreen({super.key});

  @override
  State<_AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<_AddCategoryScreen> {
  late final CategoryBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<CategoryBloc>(context);
    bloc.add(CategoryEvent.loadAllSubscription());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: MediaQuery.sizeOf(context).height * .8,
      child: BlocConsumer<CategoryBloc, CategoryState>(
        listenWhen: (prev, curr) {
          return prev.listenStatus != curr.listenStatus;
        },
        listener: (context, state) {
          state.listenStatus?.when(
            success: (title, message) {
              if (title == kCreateCategorySuccess) {
                context.pop(true);
              }
            },
            error: (title, message) {
              if (title == kCreateCategoryError) {
                final snackBar = SnackBar(content: Text(message));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
          );
        },
        builder: (context, state) {
          if (state.status is LoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state.allSubscriptions.isEmpty) {
            return Center(
              child: Text(
                "Something went wrong",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Add a category",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.left,
              ),
              CustomTextField.outlineBorder(
                controller: bloc.controller,
                borderRadius: 22,
              ),
              Text(
                "Select subscriptions",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.allSubscriptions.length,
                  itemBuilder: (context, index) {
                    return SubsSelectionTile(
                      subscription: state.allSubscriptions[index],
                      idx: index,
                      selected: state.selectedSubsIndex.contains(index),
                      onTap: (i) {
                        bloc.add(CategoryEvent.addRemoveSubs(idx: i));
                      },
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed:
                    state.selectedSubsIndex.isEmpty
                        ? null
                        : () {
                          bloc.add(CategoryEvent.createNewCategory());
                        },
                child: Text("Create Category"),
              ),
            ],
          );
        },
      ),
    );
  }
}
