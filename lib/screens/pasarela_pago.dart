import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class pasarelaPago extends StatefulWidget {
  pasarelaPago({Key? key}) : super(key: key);

  @override
  State<pasarelaPago> createState() => _pasarelaPagoState();
}

class _pasarelaPagoState extends State<pasarelaPago> {
  final _formkey = GlobalKey<FormState>();
  var cardMask = MaskTextInputFormatter(mask: '#### #### #### ####',filter: { "#": RegExp(r'[0-9]')});
  var dateMask = MaskTextInputFormatter(mask: '##/##',filter: { "#": RegExp(r'[0-9]')});
  var codeMask = MaskTextInputFormatter(mask: '###',filter: { "#": RegExp(r'[0-9]')});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => {
            Navigator.pushReplacementNamed(context, 'form_contenedor')
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 190,
                      decoration: BoxDecoration(
                        image: new DecorationImage(image: AssetImage('assets/tarjeta.png'),
                        fit: BoxFit.fill
                      ),
                    )
                    ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey) 
                      ),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: "Nombre del titular",
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey) 
                      ),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      inputFormatters: [cardMask],
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: "0000 0000 0000 0000",
                        border: InputBorder.none
                        ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    child: Row(
                      children: [
                        Container(
                          width:  MediaQuery.of(context).size.width*0.45,
                          child: _inputDate(),
                        ),
                        Container(
                          width:  MediaQuery.of(context).size.width*0.45,
                          child: _inputCode(),
                        )
                      ],
                    )
                  ),
                  SizedBox(height: 20,),

                  Container(
                    height: 40,
                    margin: EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width - 30,
                    child: ElevatedButton(onPressed: (){}, child: Text('Pagar',style: TextStyle(fontSize: 20),)))
                ],
              ),
              
          ),
        ),
      ),
    );
  }

  Container _inputDate(){
    return Container(
      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey) 
                      ),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      inputFormatters: [dateMask],
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: "01/24",
                        border: InputBorder.none
                        ),
                    ),
    );
  }

  Container _inputCode(){
    return Container(
      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey) 
                      ),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      inputFormatters: [codeMask],
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: "000",
                        border: InputBorder.none
                        ),
                    ),
    );
  }

}