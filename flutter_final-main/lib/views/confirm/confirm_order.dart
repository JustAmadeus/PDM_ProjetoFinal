import 'package:flutter/material.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(onTap: () => Navigator.pop(context), child: Image.asset('assets/images/Group.png')),
              SizedBox(height: 10),
              Text(
                'Confirmar Pedido',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Endereço", style: TextStyle(fontSize: 14, color: Color(0x553B3B3B)),),
                              Text("Editar", style: TextStyle(color: Color(0xFF53E88B), fontSize: 14),),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset('assets/images/location.png'),
                              SizedBox(width: 10),
                              Expanded(child: Text("4517 Washington Ave. Manchester, Kentucky 39495", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Método de pagamento", style: TextStyle(fontSize: 14, color: Color(0x553B3B3B)),),
                              Text("Editar", style: TextStyle(color: Color(0xFF53E88B), fontSize: 14),),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('assets/images/paypal.png'),
                              SizedBox(width: 10),
                              Text("476.579.***-**", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: Color(0xFF15BE77)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sub-total", style: TextStyle(fontSize: 14, color: Colors.white),),
                        Text("180", style: TextStyle(fontSize: 14, color: Colors.white)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Taxa de Entrega", style: TextStyle(fontSize: 14, color: Colors.white)),
                        Text("10", style: TextStyle(fontSize: 14, color: Colors.white)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Desconto", style: TextStyle(fontSize: 14, color: Colors.white)),
                        Text("20", style: TextStyle(fontSize: 14, color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                        Text("150", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmOrder())),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        margin: EdgeInsets.only(bottom: 10, top: 5),
                        width: double.infinity,
                        decoration:
                        BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          "Encerre meu pedido",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF15BE77),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
