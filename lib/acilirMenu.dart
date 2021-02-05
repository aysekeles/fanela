import 'package:fanela/gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ViewControllers/HomePage.dart';
import 'map_ekle.dart';

class AcilirMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 21.0),
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Image.asset('assets/fanela-logo.jpg'),
            ),
            Divider(
              height: 4.0,
              color: Colors.blueGrey,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.image),
                    title: Text(
                      'GALERİ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GalleryTakePhoto()),
                      );
                      // Navigator.pop(context);
                    },
                  ),
                  Divider(
                    height: 1.0,
                    color: Colors.blueGrey,
                  ),
                  ListTile(
                    leading: Icon(Icons.note),
                    title: Text(
                      'NOTLAR',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                      //Navigator.pop(context);
                    },
                  ),
                  Divider(
                    height: 1.0,
                    color: Colors.blueGrey,
                  ),
                  ListTile(
                    leading: Icon(Icons.map),
                    title: Text(
                      'HARİTA',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapEkle()),
                      );
                    },
                  ),
                  Divider(
                    height: 1.0,
                    color: Colors.blueGrey,
                  ),
                  ListTile(
                    leading: Icon(Icons.message),
                    title: Text(
                      'MESAJLAR',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Divider(
                    height: 1.0,
                    color: Colors.blueGrey,
                  ),
                  ExpansionTile(
                    title: Text(
                      'HES KODU',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20.0),
                        child: ListTile(
                          leading: Icon(Icons.fingerprint),
                          title: Text(
                            'E-DEVLET ile ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            _openUrl(
                                'https://hayatevesigar.saglik.gov.tr/hes.html?gclid=CjwKCAiAouD_BRBIEiwALhJH6MogN1CgRgzf77a6fT_AV8DwdxHTdIGEyjCP9oGW9pL-UKp2CC1AxRoC6i4QAvD_BwE'); // gelen linki açar..
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.0),
                        child: ListTile(
                          leading: Icon(Icons.mobile_friendly),
                          title: Text(
                            'UYGULAMA İLE',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {
                            // emilator üzerinde hayat eve sigar olmadığı iiçin burdaki navigator kısmı disactive
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.0),
                        child: ListTile(
                          leading: Icon(Icons.chat_bubble),
                          title: Text(
                            'SMS İLE',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future _openUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw ' Adrese ulaşılamadı!!!';
  }
}
