import 'package:flutter/material.dart';
import 'package:luxe/providers/user_profile_provider.dart';
import 'package:provider/provider.dart';

class EstadoCuentaScreen extends StatefulWidget {
  const EstadoCuentaScreen({Key? key}) : super(key: key);

  @override
  State<EstadoCuentaScreen> createState() => _EstadoCuentaScreenState();
}

class _EstadoCuentaScreenState extends State<EstadoCuentaScreen> {
  @override
  Widget build(BuildContext context) {

    final userProfileProvider = Provider.of<UserProfileProvider>(context);

    final account = userProfileProvider.account;

    if(account == null){
      return  Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: const Center(
          child: CircularProgressIndicator(color: Colors.grey),
        ),
      );
    }
    final String plan = account.plan;
    final registrationDate =  DateTime.fromMillisecondsSinceEpoch(account.registrationDate);
    final expirationDate =  DateTime.fromMillisecondsSinceEpoch(account.expirationDate);
    final rentalPrice = account.rentalPrice;

    const textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    const textStyle2 = TextStyle(fontSize: 20, color: Colors.black45);
    return Scaffold(
      appBar: AppBar(
        title:const Text('Estado de cuenta', textAlign: TextAlign.center,style: TextStyle( fontSize: 30 ,color: Color.fromRGBO(0, 41, 107, 1)),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => {Navigator.of(context).pop()},
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Plan: ' , style: textStyle,),
              Text(plan, style: textStyle2,)
            ],
          ),
          SizedBox(height: 25,),
          Row(
            children: [
              const Text('Precio de alquiler: ' , style: textStyle,),
              Text('$rentalPrice', style: textStyle2,)
            ],
          ),
          SizedBox(height: 25,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Fecha de registro: ' , style: textStyle,),
              const SizedBox(height: 10,),
              Text('$registrationDate', style: textStyle2,)
            ],
          ),
          SizedBox(height: 25,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Vencimiento de alquiler: ' , style: textStyle,),
              const SizedBox(height: 10,),
              Text('$expirationDate', style: textStyle2,)
            ],
          ),

        ],
      ),
    ),
    );
  }
}