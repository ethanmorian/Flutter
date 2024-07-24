import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewPage extends StatefulWidget {
  List<String> imagePaths;
  int currentIndex;

  PhotoViewPage({
    super.key,
    required this.imagePaths,
    required this.currentIndex,
  });

  @override
  State<PhotoViewPage> createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoViewPage> {
  int currentPageIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    currentPageIndex = widget.currentIndex;
    _controller = PageController(initialPage: widget.currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PhotoViewGallery.builder(
              pageController: _controller,
              itemCount: widget.imagePaths.length,
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  maxScale: PhotoViewComputedScale.covered * 3,
                  minScale: PhotoViewComputedScale.contained,
                  imageProvider: NetworkImage(widget.imagePaths[index]),
                );
              },
              loadingBuilder: (context, event) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 25, top: 25),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: Text(
                  '${currentPageIndex + 1} / ${widget.imagePaths.length}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
