//This for Search Screen widget

import 'package:challengeday1/classes/image_class.dart';
import 'package:challengeday1/classes/images_list_class.dart';
import 'package:challengeday1/utilities/constants.dart';
import 'package:flutter/material.dart';

class BottomSectionSearchScreen extends StatefulWidget {
  const BottomSectionSearchScreen({Key? key}) : super(key: key);

  @override
  State<BottomSectionSearchScreen> createState() => _BottomSectionSearchScreenState();
}

class _BottomSectionSearchScreenState extends State<BottomSectionSearchScreen> {
  ImageList imageList = new ImageList();
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < kImagesListVertical.length; i++) {
      imageList.addToList(new ImageClass(path: kImagesListVertical[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: imageList.getNumberOfImages(),
            primary: false,
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 7.5,
              mainAxisSpacing: 7.5,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(imageList.getPath(index)),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Colors.grey[100]!.withOpacity(0.0),
                              Colors.grey[300]!.withOpacity(0.3),
                              Colors.grey[700]!.withOpacity(1.0),
                            ],
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            imageList.changeIsToggledProp(index);
                          });
                        },
                        icon: Icon(
                          imageList.getIsChecked(index)
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: Colors.pink[300],
                        ),
                      ),
                    )
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
