import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class ArtistsWidget extends StatelessWidget {
  const ArtistsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    final artists = [
      {
        'name': 'Artist 1',
        'art': 'Artist',
        'image':
            'https://plus.unsplash.com/premium_photo-1668430856694-62c7753fb03b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8',
      },
      {
        'name': 'Artist 1',
        'art': 'Comedian',
        'image':
            'https://plus.unsplash.com/premium_photo-1668430856694-62c7753fb03b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8',
      },
      {
        'name': 'Artist 1',
        'art': 'Artist',
        'image':
            'https://plus.unsplash.com/premium_photo-1668430856694-62c7753fb03b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8',
      },
      {
        'name': 'Artist 1',
        'art': 'Artist',
        'image':
            'https://plus.unsplash.com/premium_photo-1668430856694-62c7753fb03b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8',
      },
      {
        'name': 'Artist 1',
        'art': 'Artist',
        'image':
            'https://plus.unsplash.com/premium_photo-1668430856694-62c7753fb03b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8',
      },
      {
        'name': 'Artist 1',
        'art': 'Artist',
        'image':
            'https://plus.unsplash.com/premium_photo-1668430856694-62c7753fb03b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Artists', style: textTheme.bodySmall),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: artists.length,
            itemBuilder: (context, index) {
              final artist = artists[index];
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(artist['image']!),
                    ),
                    const SizedBox(height: 5),
                    Text(artist['name']!, style: textTheme.titleMedium),
                    const SizedBox(height: 5),
                    Text(
                      artist['art']!,
                      style: textTheme.titleSmall!.copyWith(
                        color: AppColors.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
