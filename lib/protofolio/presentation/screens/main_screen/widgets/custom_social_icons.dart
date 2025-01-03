import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/download_cubit_cubit.dart';
import '../cubit/download_cubit_state.dart';

class CustomSocialIcons extends StatelessWidget {
  const CustomSocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DownloadCubit(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<DownloadCubit, DownloadState>(
            listener: (context, state) {
              if (state is DownloadSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content:
                          Text('Downloaded successfully to ${state.filePath}')),
                );
              } else if (state is DownloadError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            builder: (context, state) {
              if (state is DownloadInProgress) {
                return Column(
                  children: [
                    LinearProgressIndicator(
                      value: state.progress,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${(state.progress * 100).toStringAsFixed(0)}%",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              } else if (state is DownloadSuccess) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "File saved at: ${state.filePath}",
                    style: const TextStyle(fontSize: 14, color: Colors.green),
                    textAlign: TextAlign.center,
                  ),
                );
              }
              return ElevatedButton.icon(
                onPressed: () => context.read<DownloadCubit>().downloadCV(),
                icon: const Icon(Icons.download, color: Colors.white),
                label: const Text(
                  "Download CV",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
