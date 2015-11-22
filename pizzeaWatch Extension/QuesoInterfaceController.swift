//
//  QuesoInterfaceController.swift
//  pizzea
//
//  Created by wififer on 22/11/15.
//  Copyright © 2015 Fernando Ransanz. All rights reserved.
//

import WatchKit
import Foundation


class QuesoInterfaceController: WKInterfaceController {

    @IBOutlet var quesoPk: WKInterfacePicker!
    var quesos = ["Mozzarella","Chedar", "Parmesano", "Sin queso"]
    var miTamano:String = ""
    var miMasa:String = ""
    var miQueso:String = ""

    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var pickerItems: [WKPickerItem] = []
        for t in quesos {
            let item = WKPickerItem()
            item.title = t
            pickerItems.append(item)
        }
        self.quesoPk.setItems(pickerItems)
        let p = context as! Pizza
        miTamano = p.tamano
        miMasa = p.masa
        print("pizza tamaño: ",miTamano)
        print("pizza masa: ",miMasa)

    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func toIngredientes() {
        
        if miQueso == "" {
            miQueso = "Mozzarella"
        }
        let pizzaContexto = Pizza(t: miTamano, m: miMasa, q: miQueso, i: [])
        pushControllerWithName("quesoToIngredientes", context: pizzaContexto)
        
    }
    
    @IBAction func pickerSelector(value: Int) {
        print("value: ",value)
        if (value == 0) {
            self.miQueso = "Mozzarella"
        }else if (value == 1) {
            self.miQueso = "Chedar"
        }else if (value == 2) {
            self.miQueso = "Parmesano"
        }else if (value == 3){
            self.miQueso = "Sin queso"
          }
        print("miQueso: ",miQueso)
        
    }


}
