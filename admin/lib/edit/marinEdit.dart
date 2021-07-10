import 'package:admin/controllers/marinEditController.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MarinEdit extends GetView<MarinEditController> {
  final String id = Get.parameters['id']!;
  @override
  Widget build(BuildContext context) {
    controller.setControllers(id);
    return MainBody(
      title: 'تصحيح البحار',
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        crossAxisAlignment: WrapCrossAlignment.center,
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
                        labelText: "الاسم العائلي",
                      ),
                      keyboardType: TextInputType.name,
                      controller: controller.nameLastController),
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
                        labelText: "الاسم الشخصي",
                      ),
                      keyboardType: TextInputType.name,
                      controller: controller.nameFirstController),
                )),
          ),
          SizedBox(
            width: 300,
            height: 70,
            child: OutlinedButton(
                onPressed: null,
                child: ListTile(
                  title: TextFormField(
                    readOnly: true,
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
                      labelText: "الضمان الاجتماعي",
                    ),
                    //keyboardType: TextInputType.name,
                    controller: controller.cnssController,
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
                      controller.correctMarin();
                    },
                    child: ListTile(
                      title: Text(
                        'صحح البحار',
                        textAlign: TextAlign.center,
                      ),
                    ))),
          ),
        ],
      ),
    );
  }
}
