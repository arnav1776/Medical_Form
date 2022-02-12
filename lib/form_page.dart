import 'package:flutter/material.dart';
import 'package:medical_form/user_model.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late UserModel userModel = new UserModel(
    "",
    18,
    "",
    new List<String>.empty(growable: true),
  );

  @override
  void initState() {
    super.initState();

    userModel.details.add("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medical Form"),
        backgroundColor: Colors.redAccent,
      ),
      body: _uiWidget(),
    );
  }

  Widget _uiWidget() {
    return new Form(
      key: globalFormKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: FormHelper.inputFieldWidgetWithLabel(
                  context,
                  Icon(Icons.web),
                  "name",
                  "Patient Name",
                  "",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return 'Patient Name can\'t be empty.';
                    }

                    return null;
                  },
                  (onSavedVal) => {
                    this.userModel.patientName = onSavedVal,
                  },
                  initialValue: this.userModel.patientName,
                  obscureText: false,
                  borderFocusColor: Theme.of(context).primaryColor,
                  prefixIconColor: Theme.of(context).primaryColor,
                  borderColor: Theme.of(context).primaryColor,
                  borderRadius: 2,
                  paddingLeft: 0,
                  paddingRight: 0,
                  showPrefixIcon: false,
                  fontSize: 13,
                  labelFontSize: 13,
                  onChange: (val) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: FormHelper.inputFieldWidgetWithLabel(
                  context,
                  Icon(Icons.web),
                  "name",
                  "Patient Age",
                  "",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return 'Age can\'t be empty.';
                    }

                    return null;
                  },
                  (onSavedVal) => {
                    this.userModel.patientAge = int.parse(onSavedVal),
                  },
                  initialValue: this.userModel.patientAge.toString(),
                  obscureText: false,
                  borderFocusColor: Theme.of(context).primaryColor,
                  prefixIconColor: Theme.of(context).primaryColor,
                  borderColor: Theme.of(context).primaryColor,
                  borderRadius: 2,
                  paddingLeft: 0,
                  paddingRight: 0,
                  showPrefixIcon: false,
                  fontSize: 13,
                  labelFontSize: 13,
                  onChange: (val) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: FormHelper.inputFieldWidgetWithLabel(
                  context,
                  Icon(Icons.web),
                  "name",
                  "Disease Name",
                  "",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return 'Disease Name can\'t be empty.';
                    }

                    return null;
                  },
                  (onSavedVal) => {
                    this.userModel.diseaseName = onSavedVal,
                  },
                  initialValue: this.userModel.patientName,
                  obscureText: false,
                  borderFocusColor: Theme.of(context).primaryColor,
                  prefixIconColor: Theme.of(context).primaryColor,
                  borderColor: Theme.of(context).primaryColor,
                  borderRadius: 2,
                  paddingLeft: 0,
                  paddingRight: 0,
                  showPrefixIcon: false,
                  fontSize: 13,
                  labelFontSize: 13,
                  onChange: (val) {},
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Symptom(s)",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                  detailsContainerUI(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Medicine(s)",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                  detailsContainerUI(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Time",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                  detailsContainerUI(),
                  new Center(
                    child: FormHelper.submitButton(
                      "Save",
                      () async {
                        if (validateAndSave()) {
                          print(this.userModel.toJson());
                        }
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailsContainerUI() {
    return ListView.separated(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: this.userModel.details.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Row(children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                child: detailUI(index),
              ),
            ]),
          ],
        );
      },
      separatorBuilder: (context, index) => Divider(),
    );
  }

  Widget detailUI(index) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: FormHelper.inputFieldWidget(
              context,
              Icon(Icons.web),
              "detail_$index",
              "",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Detail ${index + 1} can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                this.userModel.details[index] = onSavedVal,
              },
              initialValue: this.userModel.details[index],
              obscureText: false,
              borderFocusColor: Theme.of(context).primaryColor,
              prefixIconColor: Theme.of(context).primaryColor,
              borderColor: Theme.of(context).primaryColor,
              borderRadius: 2,
              paddingLeft: 0,
              paddingRight: 0,
              showPrefixIcon: false,
              fontSize: 13,
              onChange: (val) {},
            ),
          ),
          Visibility(
            child: SizedBox(
              width: 35,
              child: IconButton(
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.green,
                ),
                onPressed: () {
                  addDetailControl();
                },
              ),
            ),
            visible: index == this.userModel.details.length - 1,
          ),
          Visibility(
            child: SizedBox(
              width: 35,
              child: IconButton(
                icon: Icon(
                  Icons.remove_circle,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  removeDetailControl(index);
                },
              ),
            ),
            visible: index > 0,
          )
        ],
      ),
    );
  }



  void addDetailControl() {
    setState(() {
      this.userModel.details.add("");
    });
  }

  void removeDetailControl(index) {
    setState(() {
      if (this.userModel.details.length > 1) {
        this.userModel.details.removeAt(index);
      }
    });
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
