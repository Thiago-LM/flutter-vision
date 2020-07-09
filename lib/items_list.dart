import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({Key key, this.firestore}) : super(key: key);

  final Firestore firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('items').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        final int itemsCount = snapshot.data.documents.length;
        return ListView.builder(
          itemCount: itemsCount,
          itemBuilder: (_, int index) {
            final DocumentSnapshot document = snapshot.data.documents[index];
            return SafeArea(
              top: false,
              bottom: false,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                height: 310.0,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // photo and title
                      SizedBox(
                        height: 184.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Image.network(
                                document['downloadURL']
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                          child: DefaultTextStyle(
                            softWrap: true,
                            //overflow: TextOverflow.,
                            style: Theme.of(context).textTheme.subtitle1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(document['labels'].join(', ')),
                              ]
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}