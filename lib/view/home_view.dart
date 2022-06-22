import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_to_basket_cubit/cubit/counter_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: CounterWidget(),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String ayakkabipath = "assets/ayakkabi.jpg";
    return Scaffold(
        appBar: AppBar(
          actions: [
            Row(children: [
              Padding(
                padding: MainPadding.all(),
                child: Icon(Icons.shopping_basket_outlined),
              ),
              Padding(
                padding: MainPadding.all(),
                child: Builder(builder: (context) {
                  return Text(context.watch<CounterCubit>().state.toString(),
                      style: TextStyle(fontSize: 20));
                }),
              ),
            ]),
          ],
        ),
        body: Column(children: [
          Image.asset(
            ayakkabipath,
            width: 200,
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    context.read<CounterCubit>().arttir();
                  },
                  icon: const Icon(Icons.add),
                );
              }),
              Builder(builder: (context) {
                return Text(context.watch<CounterCubit>().state.toString());
              }),
              BlocSelector<CounterCubit, int, int>(
                selector: (state) {
                  return state;
                },
                builder: (context, state) {
                  return IconButton(
                      onPressed: () {
                        if (state > 0) context.read<CounterCubit>().azalt();
                      },
                      icon: const Icon(
                        Icons.remove,
                      ));
                },
              ),
              BlocProvider(
                create: (context) => CounterCubit(),
                child: ElevatedButton(onPressed: () {}, child: Text("add")),
              )
            ],
          )
        ]));
  }
}

class MainPadding extends EdgeInsets {
  MainPadding.all() : super.all(10);
}
