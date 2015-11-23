//
//  IngredietesInterfaceController.swift
//  pizzea
//
//  Created by subdireccion.archivos.spain@gmail.com on 23/11/15.
//  Copyright © 2015 Fernando Ransanz. All rights reserved.
//

import WatchKit
import Foundation


class IngredietesInterfaceController: WKInterfaceController {

    @IBOutlet var jamonSW: WKInterfaceSwitch!
    @IBOutlet var pepperoniSW: WKInterfaceSwitch!
    @IBOutlet var cebollaSW: WKInterfaceSwitch!
    @IBOutlet var pimientoSW: WKInterfaceSwitch!
    @IBOutlet var anchoaSW: WKInterfaceSwitch!
    
    var  ingredientes:[String] = []
    var miTamano:String = ""
    var miMasa:String = ""
    var miQueso:String = ""

    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let p = context as! Pizza
        miTamano = p.tamano
        miMasa = p.masa
        miQueso = p.queso
        print("pizza tamaño: ",miTamano)
        print("pizza masa: ",miMasa)
        print("pizza queso: ",miQueso)
        ingredientes.reserveCapacity(5)


    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func toResumen() {
        print("Ingredientes: \(ingredientes)")
        
        
        if (ingredientes.count != 0){
            
            let pizzaContexto = Pizza(t: miTamano, m: miMasa, q: miQueso, i: ingredientes)
            pushControllerWithName("ingredientesToConfirmacion", context: pizzaContexto)
            
        }else{
            print("No ha seleccionado ingredientes")
            showAlertPressed()
        }
    }
    @IBAction func jamonEstado(value: Bool) {
        if value == true {
            print("Jamon")
            
            ingredientes.insert("Jamon",atIndex:ingredientes.count)
            
        } else {
            print("quitar Jamon")
            let pos = ingredientes.indexOf("Jamon")
            ingredientes.removeAtIndex(pos!)
            print("Ingredientes: \(ingredientes)")

        }

    }
    
    @IBAction func pepperoniEstado(value: Bool) {
        if value == true {
            print("Pepperoni")
            ingredientes.insert("Pepperoni",atIndex:ingredientes.count)
            
        } else {
            print("quitar Pepperoni")
            let pos = ingredientes.indexOf("Pepperoni")
            ingredientes.removeAtIndex(pos!)
            print("Ingredientes: \(ingredientes)")

        }

    }
    
    @IBAction func ceboallaEstado(value: Bool) {
        if value == true {
            print("Cebolla")
            ingredientes.insert("Cebolla",atIndex:ingredientes.count)
            
        } else {
            let pos = ingredientes.indexOf("Cebolla")
            ingredientes.removeAtIndex(pos!)
        }
    }
    @IBAction func pimientoEstado(value: Bool) {
        if value == true {
            print("Pimiento")
            ingredientes.insert("Pimiento",atIndex:ingredientes.count)
            
        } else {
            let pos = ingredientes.indexOf("Pimiento")
            ingredientes.removeAtIndex(pos!)
        }
    }
    @IBAction func anchoaEstado(value: Bool) {
        if value == true {
            print("Anchoa")
            ingredientes.insert("Anchoa",atIndex:ingredientes.count)
            
        } else {
            let pos = ingredientes.indexOf("Anchoa")
            ingredientes.removeAtIndex(pos!)
        }
    }
    
  func showAlertPressed() {
        let cancel = WKAlertAction(title: "Aceptar", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
            
        })
        
    
        
        self.presentAlertControllerWithTitle("Atención!", message: "Al menos un ingrediente", preferredStyle: WKAlertControllerStyle.Alert, actions: [cancel])
    }
    
}
