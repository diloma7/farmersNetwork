import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'MyVideoPlayer.dart';

class AdWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyVideoPlayer()));
      },
      child: Container(
          margin: new EdgeInsets.fromLTRB(5, 0, 10, 5),
          decoration: BoxDecoration(
            color: Color(0XFFEB8A44),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              Container(
                  width: 72.0,
                  height: 72,
                  color: Colors.grey[200],
                  margin: EdgeInsets.fromLTRB(10, 1, 1, 1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: " ",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(width: 1, color: Colors.black12),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.image,
                        color: Colors.transparent,
                      ),
                      fit: BoxFit.cover,
                    ),
                  )
              ),
              Expanded(
                  child: Container(
                   width: MediaQuery.of(context).size.width,
                   padding: EdgeInsets.all(14),
                   margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                   decoration: BoxDecoration(
                   color: Color(0XFFEB8A44),
                   borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                    child: Text(
                  "Africa #SoilHealth Ambassandor Empowering small holder farmers to produce, sale healthy and affordable food.",
                  style: TextStyle(
                      fontFamily: 'NunitoLight',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 10),
                ),
                 )
              )
            ],
          )),
    );
  }
}
