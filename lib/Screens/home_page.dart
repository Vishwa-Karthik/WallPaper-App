import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper/Services/api_service.dart';

import 'img_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    ApiService.getImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpapers'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //* Image Grid
          Expanded(
            child: FutureBuilder(
              future: ApiService.getImage(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                //* if error exists
                if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error} occured !!'),
                  );
                }

                //* if data exists
                else if (snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final result = snapshot.data![index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            //* Photo
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ImgScreen(
                                      imgPath: result.src.large2X,
                                    ),
                                  ),
                                );
                              },
                              child: Expanded(
                                flex: 3,
                                child: Image.network(result.src.tiny),
                              ),
                            ),

                            //* Photographer Name
                            Text(result.photographer),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),

          //* Load More
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Load More',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
