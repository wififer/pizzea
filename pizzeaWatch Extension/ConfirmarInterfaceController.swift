//
//  ConfirmarInterfaceController.swift
//  pizzea
//
//  Created by subdireccion.archivos.spain@gmail.com on 23/11/15.
//  Copyright © 2015 Fernando Ransanz. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmarInterfaceController: WKInterfaceController {

    @IBOutlet var tamano: WKInterfaceLabel!
    @IBOutlet var masa: WKInterfaceLabel!
    @IBOutlet var queso: WKInterfaceLabel!
    @IBOutlet var ingredientes: WKInterfaceLabel!
    var ingredientes2:String = ""
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let p = context as! Pizza
        tamano.setText(p.tamano)
        masa.setText(p.masa)
        queso.setText(p.queso)
        for v in p.ingredientes {
            self.ingredientes2 += "\n\(v)"
            
        }
        ingredientes.setText(self.ingredientes2)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func enviar() {
        
        showAlertPressed()
    }
    
    func showAlertPressed() {
        let cancel = WKAlertAction(title: "Cancelar", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
            
        })
        let acept = WKAlertAction(title: "Aceptar", style: WKAlertActionStyle.Default, handler: { () -> Void in
            
        })
        
        
        self.presentAlertControllerWithTitle("Pizzea", message: "Enviando a cocina!!!", preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert, actions: [cancel,acept])
    }
}
