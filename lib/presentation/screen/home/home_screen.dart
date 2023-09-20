import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_generated/presentation/assets/assets.gen.dart';
import 'package:flutter_generated/presentation/blocs/todo/todo_cubit.dart';

class HomeSreen extends StatelessWidget {
  const HomeSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Assets.images.penguin3.image(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<TodoCubit, TodoState>(
                builder: (context, state) => state.todoListState.maybeWhen(
                  initial: () =>
                      const Center(child: CircularProgressIndicator()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  success: (todoList) => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemCount: todoList.length,
                    itemBuilder: (context, index) {
                      final data = todoList[index];
                      return Card(
                        elevation: 5,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              children: [
                                Text(data.todo),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: data.todoDetails.length,
                                  itemBuilder: (context, detailIndex) {
                                    final detail =
                                        data.todoDetails[detailIndex];

                                    return Row(
                                      children: [
                                        Checkbox(
                                          value: false,
                                          onChanged: (value) {},
                                        ),
                                        Text(detail),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  error: (error) => Center(child: Text(error ?? '')),
                  orElse: () => const SizedBox.shrink(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
