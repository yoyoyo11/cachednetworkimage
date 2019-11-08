import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'CachedNetworkImage Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(),
      );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('CachedNetworkImage')),
        body: _testContent(),
      );

  _testContent() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _sizedContainer(
              Image(
                image: CachedNetworkImageProvider(
                  'http://via.placeholder.com/350x150',
                ),
              ),
            ),
            _sizedContainer(
              CachedNetworkImage(
                placeholder: (context, url) => CircularProgressIndicator(),
                imageUrl: 'http://via.placeholder.com/200x150',
              ),
            ),
            _sizedContainer(
              CachedNetworkImage(
                imageUrl: 'https://firebasestorage.googleapis.com/v0/b/hire-7dbb2.appspot.com/o/@thumb_1573077245510.jpg?alt=media&token=07a4904a-5fd6-4b81-a494-533a979c3e2d',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.red,
                        BlendMode.colorBurn,
                      ),
                    ),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            // _sizedContainer(
            //   CachedNetworkImage(
            //     imageUrl: 'http://notAvalid.uri',
            //     placeholder: (context, url) => CircularProgressIndicator(),
            //     errorWidget: (context, url, error) => const Icon(Icons.error),
            //   ),
            // ),
            // _sizedContainer(
            //   CachedNetworkImage(
            //     imageUrl: 'not a uri at all',
            //     placeholder: (context, url) => CircularProgressIndicator(),
            //     errorWidget: (context, url, error) => const Icon(Icons.error),
            //   ),
            // ),
            _sizedContainer(
              CachedNetworkImage(
                imageUrl: 'https://firebasestorage.googleapis.com/v0/b/hire-7dbb2.appspot.com/o/@thumb_1573181933093.jpg?alt=media&token=eed9443d-631c-445b-b248-cd2fac647b8d',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fadeOutDuration: const Duration(seconds: 1),
                fadeInDuration: const Duration(seconds: 3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _gridView() {
    return GridView.builder(
      itemCount: 250,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) => CachedNetworkImage(
        imageUrl: 'http://via.placeholder.com/'
            '${(index + 1)}x${(index % 100 + 1)}',
        placeholder: _loader,
        errorWidget: _error,
      ),
    );
  }

  Widget _loader(BuildContext context, String url) => Center(
        child: CircularProgressIndicator(),
      );

  Widget _error(BuildContext context, String url, Exception error) {
    print(error);
    return Center(child: const Icon(Icons.error));
  }

  Widget _sizedContainer(Widget child) => SizedBox(
        width: 300.0,
        height: 150.0,
        child: Center(child: child),
      );
}
