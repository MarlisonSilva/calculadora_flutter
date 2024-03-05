import 'dart:html';

import 'package:calculator/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
  HomeController controller = HomeController();
  @override
  Widget build(context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10, left: 20, right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: AnimatedBuilder(
                  animation: controller.answer,
                  builder: (context, child) { 
                    return Text(controller.getAnswer(),
                      style: const TextStyle(
                      color: Color.fromARGB(255, 150, 111, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      )
                    );
                  },
                ),
              ),
            ),
            Row(
              children: [
                Expanded(child: TextButton(onPressed: () { controller.clear(); }, child: Text('AC', style: TextStyle(color: Colors.amberAccent),))),
                Expanded(child: TextButton(onPressed: () { controller.removeChar(); }, child: Icon(Icons.backspace_outlined, size: 15, color: Colors.amberAccent,))),
                Expanded(child: TextButton(onPressed: () {}, child: Text('%', style: TextStyle(color: Colors.amberAccent),))),
                Expanded(child: TextButton(onPressed: () { controller.addOp('/'); }, child: Text('\u00F7', style: TextStyle(color: Colors.amberAccent),))),
              ],
            ),
            
            Row(
              children: [
                Expanded(child: TextButton(onPressed: () { controller.addAlg('7'); }, child: Text('7'))),
                Expanded(child: TextButton(onPressed: () { controller.addAlg('8'); }, child: Text('8'))),
                Expanded(child: TextButton(onPressed: () { controller.addAlg('9'); }, child: Text('9'))),
                Expanded(child: TextButton(onPressed: () { controller.addOp('*'); }, child: Text('x', style: TextStyle(color: Colors.amberAccent),))),
              ],
            ),

            Row(
              children: [
                Expanded(child: TextButton(onPressed: () { controller.addAlg('4'); }, child: Text('4'))),
                Expanded(child: TextButton(onPressed: () { controller.addAlg('5'); }, child: Text('5'))),
                Expanded(child: TextButton(onPressed: () { controller.addAlg('6'); }, child: Text('6'))),
                Expanded(child: TextButton(onPressed: () { controller.addOp('-'); }, child: Text('-', style: TextStyle(color: Colors.amberAccent),))),
              ],
            ),
            
            Row(
              children: [
                Expanded(child: TextButton(onPressed: () { controller.addAlg('1'); }, child: Text('1'))),
                Expanded(child: TextButton(onPressed: () { controller.addAlg('2'); }, child: Text('2'))),
                Expanded(child: TextButton(onPressed: () { controller.addAlg('3'); }, child: Text('3'))),
                Expanded(child: TextButton(onPressed: () { controller.addOp('+'); }, child: Text('+', style: TextStyle(color: Colors.amberAccent),))),
              ],
            ),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                Expanded(child: TextButton(onPressed: () { controller.addAlg('0'); }, child: Text('0'))),
                Expanded(child: TextButton(onPressed: () {}, child: Text(','))),
                Expanded(
                  child: AnimatedBuilder(
                      animation: controller.isCalculable,
                      builder: (context, child) { 
                        return TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(controller.isCalculable.value ? Colors.amberAccent : Colors.redAccent),
                          ), 
                          onPressed: () { 
                            if (controller.calcExpression() != 'f') {
                              controller.setAnswer(controller.calcExpression());
                            }
                          }, 
                          child: Text('=',
                            style: const TextStyle(
                            color: Colors.black,
                            )
                          ),
                        );
                      },
                  )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}