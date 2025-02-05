import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return  SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_creation_outlined, color: colors.primary,),
              const SizedBox(width: 5.0),
              Text('Cinemapedia', style: titleStyle ),
      
              const Spacer(),
      
              IconButton(
                icon: Icon(Icons.search, color: colors.primary),
                onPressed: () {})
            ],
          ),
        ),
      )
      );
  }
}