import 'package:event_app/core/config/routes/routes_name.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecommendedEventWidget extends StatelessWidget {
  const RecommendedEventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    final recommendedEvents = [
      {
        'name': 'Sajan Raj Vaidya World Tour',
        'location': 'Lakeside-06, Pokhara',
        'date': 'August 4, 2024 - August 10, 2024',
        'organizer': 'REVEL',
        'price': 'Rs.10,000 - Rs.50,000',
        'image':
            'https://plus.unsplash.com/premium_photo-1668430856694-62c7753fb03b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8',
        'routes': RoutesName.eventScreeen,
      },
      {
        'name': 'Sajan Raj Vaidya World Tour',
        'location': 'Lakeside-06, Pokhara',
        'date': 'August 4, 2024 - August 10, 2024',
        'organizer': 'REVEL',
        'price': 'Rs.10,000 - Rs.50,000',
        'image':
            'https://plus.unsplash.com/premium_photo-1668430856694-62c7753fb03b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8',
        'routes': RoutesName.eventScreeen,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recommended Events', style: textTheme.bodySmall),
        const SizedBox(height: 10),
        SizedBox(
          height: 325,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: recommendedEvents.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final event = recommendedEvents[index];
              return GestureDetector(
                onTap: () {
                  context.push('${event['routes']}');
                },
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: AppColors.cardBackgroundColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.strokeColor, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            child: Image.network(
                              event['image']!,
                              width: double.infinity,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Positioned(
                            top: 12,
                            right: 12,
                            child: CircleAvatar(
                              backgroundColor: Colors.black54,
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(event['name']!, style: textTheme.titleMedium),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.textPrimaryColor,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  event['location']!,
                                  style: textTheme.titleSmall,
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: AppColors.textPrimaryColor,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  event['date']!,
                                  style: textTheme.titleSmall,
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Text(
                                  event['organizer']!,
                                  style: textTheme.bodyMedium,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Organized by ${event['organizer']!}',
                                  style: textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColors.brandPrimaryColor,
                                  radius: 10,
                                  child: Icon(
                                    Icons.currency_rupee_sharp,
                                    color: AppColors.textPrimaryColor,
                                    size: 11,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  event['price']!,
                                  style: textTheme.bodyMedium!.copyWith(
                                    color: AppColors.brandPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
