import 'package:pdf/widgets.dart';

class ThatTable extends TableRow {
  ThatTable(
    this.cnss,
    this.lastName,
    this.firstName,
    this.reference,
    this.cin,
    this.money,
    this.sales,
  ) : super(children: [
          Container(
              height: 22,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Center(
                child: Text(
                  cnss,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              )),
          Container(
              height: 22,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  " " + lastName,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              )),
          Container(
            height: 22,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                " " + firstName,
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Container(
            height: 22,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: Center(
                child: Text(
              reference,
              style: TextStyle(
                fontSize: 12,
              ),
            )),
          ),
          Container(
            height: 22,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  " " + cin,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                )),
          ),
          Container(
            height: 22,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: Center(
                child: Text(
              "1",
              style: TextStyle(
                fontSize: 12,
              ),
            )),
          ),
          Container(
            height: 22,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: Center(
                child: Text(
              "1",
              style: TextStyle(
                fontSize: 12,
              ),
            )),
          ),
          Container(
            height: 22,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: Center(
                child: Text(
              money,
              style: TextStyle(
                fontSize: 12,
              ),
            )),
          ),
          Container(
            height: 22,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: Center(
                child: Text(
              sales,
              style: TextStyle(
                fontSize: 12,
              ),
            )),
          ),
        ]);

  final String cnss;
  final String firstName;
  final String lastName;
  final String reference;
  final String cin;
  final String sales;
  final String money;
}
