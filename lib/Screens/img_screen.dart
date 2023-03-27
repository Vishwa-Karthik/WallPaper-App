import 'package:flutter/material.dart';

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
  Future<void> setWallPaper() async {
    int location = WallPaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imgPath);
    await WallPaperManager.setWallpaperFromFile(file.path, location);
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
              onPressed: () {},
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
