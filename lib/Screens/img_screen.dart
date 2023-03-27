// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class ImgScreen extends StatefulWidget {
  const ImgScreen({
    super.key,
    required this.imgPath,
  });

  final String imgPath;

  @override
  State<ImgScreen> createState() => _ImgScreenState();
}

class _ImgScreenState extends State<ImgScreen> {
  //* set wallpaper
  Future<void> setWallPaper() async {
    int location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imgPath);
    await WallpaperManager.setWallpaperFromFile(file.path, location);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Wallpaper Set'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            //* Image
            Expanded(
              flex: 3,
              child: Image.network(widget.imgPath),
            ),

            const SizedBox(
              height: 10,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Divider(
                height: 20,
                thickness: 2,
              ),
            ),

            //* Set Wallpaper
            ElevatedButton(
              onPressed: () => setWallPaper(),
              child: const Text(
                'Set Wallpaper',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
