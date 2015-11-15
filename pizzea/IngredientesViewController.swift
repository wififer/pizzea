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
    var posJamon = 0
    var posPepperoni = 0
    var posCebolla = 0
    var posPimiento = 0
    var posAnchoa = 0



    @IBOutlet weak var jamonSw: UISwitch!
    
    @IBOutlet weak var pepperoniSw: UISwitch!
    
    @IBOutlet weak var cebollaSw: UISwitch!
    
    @IBOutlet weak var pimientoSw: UISwitch!
    
    @IBOutlet weak var anchoaSw: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Tamaño: \(toPassTamano)")
        println("Masa: \(toPassMasa)")
        println("Queso: \(toPassQueso)")
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
            let svc = segue.destinationViewController as ConfirmacionViewController;
            println("if (segue.identifier == ingredientesToConfirmacion)")

            svc.toPassTamano = toPassTamano
            svc.toPassMasa = toPassMasa
            svc.toPassQueso = toPassQueso
            svc.toPassIngredientes = ingredientes
            println("Ingredientes.count: \(ingredientes.count)")

          
            
        }
    }
    
    @IBAction func toConfirmacion(sender: AnyObject) {
        println("Ingredientes: \(ingredientes)")
        
        
        if (ingredientes.count != 0){
            println("Ingredientes: \(ingredientes)")

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
            println("Jamon")
            ingredientes.insert("Jamon",atIndex:ingredientes.count)
            posJamon = ingredientes.count-1
            
        } else {
            ingredientes.removeAtIndex(posJamon)
            
        }
    }
    
    func stateChangedPepperoni(switchState: UISwitch) {
                 if switchState.on {
            ingredientes.insert("Pepperoni",atIndex:ingredientes.count)
            posPepperoni = ingredientes.count-1
        } else {
            ingredientes.removeAtIndex(posPepperoni)
            
        }
    }
    
    func stateChangedCebolla(switchState: UISwitch) {
        if switchState.on {
            ingredientes.insert("Cebolla",atIndex:ingredientes.count)
            posCebolla = ingredientes.count-1
        } else {
            ingredientes.removeAtIndex(posCebolla)
            
        }
    }
    
    func stateChangedPimiento(switchState: UISwitch) {
        if switchState.on {
            println("Pimiento")
            ingredientes.insert("Pimiento",atIndex:ingredientes.count)
            posPimiento = ingredientes.count-1
        } else {
            ingredientes.removeAtIndex(posPimiento)
            
        }
    }
    
    func stateChangedAnchoa(switchState: UISwitch) {
        if switchState.on {
            println("Anchoa add")
            ingredientes.insert("Anchoa",atIndex:ingredientes.count)
            posAnchoa = ingredientes.count-1
        } else {
            println("Anchoa OFF")
            ingredientes.removeAtIndex(posAnchoa)
            
        }
    }




}
