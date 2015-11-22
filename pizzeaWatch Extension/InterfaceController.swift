//
//  InterfaceController.swift
//  pizzeaWatch Extension
//
//  Created by wififer on 22/11/15.
//  Copyright © 2015 Fernando Ransanz. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var tamanoPk: WKInterfacePicker!
    var tamanos = ["Grande","Mediana", "Chica"]
    var miTamano:String = "Grande"
   
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        var pickerItems: [WKPickerItem] = []
        for t in tamanos {
            let item = WKPickerItem()
            item.title = t
            pickerItems.append(item)
        }
        self.tamanoPk.setItems(pickerItems)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func toMasa() {
        
        let pizzaContexto = Pizza(t: miTamano, m: "", q: "", i: [])
        pushControllerWithName("tamanoToMasa", context: pizzaContexto)
        
    }
    
    @IBAction func pickerSelector(value: Int) {
        print("value: ",value)
        if (value == 0) {
            self.miTamano = "Grande"
        }else if (value == 1) {
            self.miTamano = "Mediana"
        }else if (value == 1) {
            self.miTamano = "Chica"
        }else{
            self.miTamano = "Grande"
 
        }
        print("miTamano: ",miTamano)

    }

}
