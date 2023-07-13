import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/songmodel.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    super.key,
    required this.song,
  });

  final Song song;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/song', arguments: song);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(song.coverUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.37,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white54,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      song.title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.purple, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      song.title,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                const Icon(
                  Icons.play_circle_filled_rounded,
                  color: Color.fromARGB(255, 38, 2, 99),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
