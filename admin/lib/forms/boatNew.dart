import 'package:admin/controllers/boatNewController.dart';

import 'package:admin/widgets/mainBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BoatInput extends GetView<BoatInputController> {
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: 'قارب جديد',
      child: Wrap(
        //alignment: WrapAlignment.spaceEvenly,
        spacing: 20,
        runSpacing: 20,
        children: [
          SizedBox(
            width: 300,
            height: 70,
            child: OutlinedButton(
                onPressed: null,
                child: ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: "الاسم",
                    ),
                    keyboardType: TextInputType.name,
                    controller: controller.nameController,
                  ),
                )),
          ),
          SizedBox(
            width: 300,
            height: 70,
            child: OutlinedButton(
                onPressed: null,
                child: ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: "التسجيل",
                    ),
                    keyboardType: TextInputType.number,
                    controller: controller.referenceController,
                  ),
                )),
          ),
          SizedBox(
            width: 300,
            height: 70,
            child: OutlinedButton(
                onPressed: null,
                child: ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: "المنطقة",
                    ),
                    keyboardType: TextInputType.name,
                    controller: controller.regionController,
                  ),
                )),
          ),
          SizedBox(
            width: 300,
            height: 70,
            child: OutlinedButton(
                onPressed: null,
                child: ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: "نسبة الاقتطاع",
                    ),
                    keyboardType: TextInputType.number,
                    controller: controller.percController,
                  ),
                )),
          ),
          SizedBox(
            width: 300,
            height: 70,
            child: OutlinedButton(
                onPressed: null,
                child: ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: "الصورة",
                    ),
                    keyboardType: TextInputType.url,
                    controller: controller.imgController,
                  ),
                )),
          ),
          SizedBox(
            width: 300,
            height: 70,
            child: OutlinedButton(
                onPressed: null,
                child: ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: "اسم المالك",
                    ),
                    keyboardType: TextInputType.name,
                    controller: controller.ownerController,
                  ),
                )),
          ),
          SizedBox(
            width: 300,
            height: 70,
            child: OutlinedButton(
                onPressed: null,
                child: ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: "رقم البطاقة",
                    ),
                    //keyboardType: TextInputType.name,
                    controller: controller.cniController,
                  ),
                )),
          ),
          SizedBox(
            width: 300,
            height: 70,
            child: OutlinedButton(
                onPressed: null,
                child: ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: "الهاتف",
                    ),
                    keyboardType: TextInputType.phone,
                    controller: controller.phoneController,
                  ),
                )),
          ),
          Center(
            child: SizedBox(
                height: 70,
                width: 300,
                child: OutlinedButton(
                    onPressed: () {
                      controller.addBoat();
                    },
                    child: ListTile(
                      title: Text(
                        'اضف القارب',
                        textAlign: TextAlign.center,
                      ),
                    ))),
          ),
        ],
      ),
    );
  }
}
