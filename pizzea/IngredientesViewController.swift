//
//  IngredientesViewController.swift
//  pizzea
//
//  Created by Fernando Ransanz on 15/11/15.
//  Copyright (c) 2015 Fernando Ransanz. All rights reserved.
//

import UIKit

class IngredientesViewController: UIViewController {
    
    var  toPassTamano:String = ""
    var  toPassMasa:String = ""
    var  toPassQueso:String = ""
    var  ingredientes:[String] = []
    @IBOutlet weak var jamonSw: UISwitch!
    
    @IBOutlet weak var pepperoniSw: UISwitch!
    
    @IBOutlet weak var cebollaSw: UISwitch!
    
    @IBOutlet weak var pimientoSw: UISwitch!
    
    @IBOutlet weak var anchoaSw: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Tamaño: \(toPassTamano)")
        print("Masa: \(toPassMasa)")
        print("Queso: \(toPassQueso)")
        // Do any additional setup after loading the view.
         jamonSw.addTarget(self, action: Selector("stateChangedJamon:"), forControlEvents: UIControlEvents.ValueChanged)
        pepperoniSw.addTarget(self, action: Selector("stateChangedPepperoni:"), forControlEvents: UIControlEvents.ValueChanged)
        cebollaSw.addTarget(self, action: Selector("stateChangedCebolla:"), forControlEvents: UIControlEvents.ValueChanged)
        pimientoSw.addTarget(self, action: Selector("stateChangedPimiento:"), forControlEvents: UIControlEvents.ValueChanged)
        anchoaSw.addTarget(self, action: Selector("stateChangedAnchoa:"), forControlEvents: UIControlEvents.ValueChanged)
       ingredientes.reserveCapacity(5)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        
        if (segue.identifier == "ingredientesToConfirmacion") {
            let svc = segue.destinationViewController as! ConfirmacionViewController;
            print("if (segue.identifier == ingredientesToConfirmacion)")

            svc.toPassTamano = toPassTamano
            svc.toPassMasa = toPassMasa
            svc.toPassQueso = toPassQueso
            svc.toPassIngredientes = ingredientes
            print("Ingredientes.count: \(ingredientes.count)")

          
            
        }
    }
    
    @IBAction func toConfirmacion(sender: AnyObject) {
        print("Ingredientes: \(ingredientes)")
        
        
        if (ingredientes.count != 0){
            print("Ingredientes: \(ingredientes)")

            self.performSegueWithIdentifier("ingredientesToConfirmacion", sender:self)

        }else{
            let alertController = UIAlertController(title: "Pizzea", message:
            "Mínimo un ingrediente", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    
    func stateChangedJamon(switchState: UISwitch) {
        
        if switchState.on {
            print("Jamon")
            ingredientes.insert("Jamon",atIndex:ingredientes.count)
            
        } else {
            let pos = ingredientes.indexOf("Jamon")
            ingredientes.removeAtIndex(pos!)
        }
    }
    
    func stateChangedPepperoni(switchState: UISwitch) {
                 if switchState.on {
            ingredientes.insert("Pepperoni",atIndex:ingredientes.count)
        } else {
                    let pos = ingredientes.indexOf("Pepperoni")
                    ingredientes.removeAtIndex(pos!)
        }
    }
    
    func stateChangedCebolla(switchState: UISwitch) {
        if switchState.on {
            ingredientes.insert("Cebolla",atIndex:ingredientes.count)
        } else {
            let pos = ingredientes.indexOf("Cebolla")
            ingredientes.removeAtIndex(pos!)
        }
    }
    
    func stateChangedPimiento(switchState: UISwitch) {
        if switchState.on {
            print("Pimiento")
            ingredientes.insert("Pimiento",atIndex:ingredientes.count)
        } else {
            let pos = ingredientes.indexOf("Pimiento")
            ingredientes.removeAtIndex(pos!)
        }
    }
    
    func stateChangedAnchoa(switchState: UISwitch) {
        if switchState.on {
            print("Anchoa add")
            ingredientes.insert("Anchoa",atIndex:ingredientes.count)
        } else {
            print("Anchoa OFF")
            let pos = ingredientes.indexOf("Anchoa")
            ingredientes.removeAtIndex(pos!)
        }
    }




}
