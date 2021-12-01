import 'package:challengeday1/classes/upload_photo_data.dart';
import 'package:challengeday1/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class UploadPhotoProvider extends StatelessWidget {
  const UploadPhotoProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Consumer<UploadPhotoData>(
          builder: (context, photoData, child) {
            return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: photoData.getNumberOfUploadedImages(),
              itemBuilder: (context, int index) {
                return photoData.getIsUploaded(index)
                    ? Container()
                    : Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.0,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(
                                      photoData.getFileImage(index),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              LinearPercentIndicator(
                                percent: 1,
                                width: 225,
                                lineHeight: 9,
                                animateFromLastPercent: true,
                                backgroundColor: kInactiveColor,
                                progressColor: kTextColor,
                                animation: true,
                                animationDuration: 3500,
                                onAnimationEnd: () {
                                  final snackBar = SnackBar(
                                    duration: Duration(
                                      milliseconds: 3000,
                                    ),
                                    content: Text(
                                      'Photo uploaded successfully!',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    backgroundColor: Colors.green,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  photoData.uploaded(index);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
