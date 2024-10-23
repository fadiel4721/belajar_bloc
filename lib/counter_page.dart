import 'package:belajar_bloc/bloc/bilangan_primer/bilangan_primer_cubit.dart';
import 'package:belajar_bloc/bloc/ganjil_genap/ganjil_genap_cubit.dart';
import 'package:belajar_bloc/visibility_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, count) => Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<BilanganPrimerCubit, bool>(builder: (context, isPrime) {
  return Column(
    children: [
      Text(isPrime ? 'Bilangan Prima' : 'Bukan Bilangan Prima'),
      ElevatedButton(
        onPressed: () {
          context.read<BilanganPrimerCubit>().hitungBilanganPrima(2);
        },
        child: const Text('Cek Bilangan Prima'),
      ),
    ],
  );
}),

            BlocBuilder<GanjilGenapCubit, int>(
              builder: (context, state) {
                return Column(
                  children: [

                    Text(state % 2 == 0 ? 'Genap' : 'Ganjil'),
                    ElevatedButton(
                        onPressed: () {
                          
                          context.read<GanjilGenapCubit>().hitungGanjilGenap(5);
                        },
                        child: const Text('Ganjil/Genap'))
                  ],
                );
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<CounterCubit>().decrement(),
                  child: const Text('-'),
                ),
                const SizedBox(width: 20),
                Text(
                  '$count',
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => context.read<CounterCubit>().increment(),
                  child: const Text('+'),
                ),
              ],
            ),
            BlocBuilder<VisibilityCubit, bool>(
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      context.read<VisibilityCubit>().change();
                    },
                    icon: Icon(state == true
                        ? Icons.visibility
                        : Icons.visibility_off));
              },
            )
          ],
        )),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.clear),
            onPressed: () => context.read<CounterCubit>().multiply(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.discount_outlined),
            onPressed: () => context.read<CounterCubit>().divide(),
          ),
        ],
      ),
    );
  }
}
