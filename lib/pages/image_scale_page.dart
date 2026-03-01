import 'package:flutter/material.dart';

class ImageScalePage extends StatelessWidget {
  const ImageScalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InteractiveViewer(
          panEnabled: true, // Set to false to prevent panning.
          minScale: 0.5,
          maxScale: 4.0,
          child: Image.network(
            'https://picsum.photos/800/600',
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const CircularProgressIndicator();
            },
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.broken_image,
                size: 100,
                color: Colors.grey,
              );
            },
          ),
        ),
      ),
    );
  }
}
