//
//  MasaInterfaceController.swift
//  pizzea
//
//  Created by wififer on 22/11/15.
//  Copyright © 2015 Fernando Ransanz. All rights reserved.
//

import WatchKit
import Foundation


class MasaInterfaceController: WKInterfaceController {
  //  let p = context as! Pizza
   // print("pizza: ",p.tamano)
    @IBOutlet var masaPk: WKInterfacePicker!
    var masas = ["Delgada","Gruesa", "Crujiente"]
    var miTamano:String = ""
    var miMasa:String = ""
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var pickerItems: [WKPickerItem] = []
        for t in masas {
            let item = WKPickerItem()
            item.title = t
            pickerItems.append(item)
        }
        self.masaPk.setItems(pickerItems)
        let p = context as! Pizza
        miTamano = p.tamano
        print("pizza tamaño: ",miTamano)

    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func toQueso() {
        
        if miMasa == "" {
            miMasa = "Delgada"
        }
                 let pizzaContexto = Pizza(t: miTamano, m: miMasa, q: "", i: [])
        pushControllerWithName("masaToQueso", context: pizzaContexto)
        
    }
    
    @IBAction func pickerSelector(value: Int) {
        print("value: ",value)
        if (value == 0) {
            self.miMasa = "Delgada"
        }else if (value == 1) {
            self.miMasa = "Gruesa"
        }else if (value == 2) {
            self.miMasa = "Crujiente"
        }else{
            self.miMasa = "Delgada"
            
        }
        print("miMasa: ",miMasa)
        
    }

}
