import 'package:flutter/material.dart';
import 'package:wallpaperpod_client/wallpaperpod_client.dart';
import 'package:wallpaperpod_flutter/main.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Wallpaper>? _resultWallpaper;

  @override
  void initState() {
    super.initState();

    _getWallpaper();
  }

  Future<void> _getWallpaper() async {
    try {
      final List<Wallpaper> result = await client.wallpaper.getAllWallpaper();
      setState(() {
        _resultWallpaper = result;
      });
    } catch (e) {
      print('========> $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: const SizedBox(),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _getWallpaper();
        },
        child: _resultWallpaper != null ? GridView.builder(
          // controller: scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 270,
          ),
          shrinkWrap: true,
          itemCount: _resultWallpaper!.length,
          padding: const EdgeInsets.all(5),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: (index%3 == 0) ? Colors.green : Colors.blue,
                ),
                child: Column(
                  children: [
                    Text(_resultWallpaper![index].name),
                    Text(_resultWallpaper![index].date.toString()),
                  ],
                ),
              ),
            );
          },
        ) : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
