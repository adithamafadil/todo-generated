import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_generated/presentation/asset/assets.dart';
import 'package:flutter_generated/presentation/blocs/todo/todo_cubit.dart';

class HomeSreen extends StatelessWidget {
  const HomeSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(Assets.penguin),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<TodoCubit, TodoState>(
                builder: (context, state) {
                  if (state is TodoSuccess) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemCount: state.todoList.length,
                      itemBuilder: (context, index) {
                        final data = state.todoList[index];
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
                                    physics:
                                        const NeverScrollableScrollPhysics(),
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
                    );
                  }

                  if (state is TodoError) {
                    return Center(child: Text(state.error ?? ''));
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
