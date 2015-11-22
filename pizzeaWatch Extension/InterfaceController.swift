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
    var miTamano:String = ""
   
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
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
    }
    
    func numberOfComponentsInPickerView(pickerView: WKInterfacePicker) -> Int {
        return 1
    }
    
    func pickerView(pickerView: WKInterfacePicker, numberOfRowsInComponent component: Int) -> Int {
        return tamanos.count
    }
    
    func pickerView(pickerView: WKInterfacePicker, titleForRow row: Int, forComponent component: Int) -> String! {
        miTamano = tamanos[row]
        return tamanos[row]
    }
}
