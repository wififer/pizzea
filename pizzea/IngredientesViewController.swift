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
        println("Tamaño: \(toPassTamano)")
        println("Masa: \(toPassMasa)")
        println("Queso: \(toPassQueso)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (jamonSw.enabled.boolValue == true) {
            ingredientes.append("Jamon")
        }
        if (pepperoniSw.enabled.boolValue == true){
            ingredientes.append("Pepperoni")
        }
        if (cebollaSw.enabled.boolValue == true){
            ingredientes.append("Cebolla")
        }
        if (pimientoSw.enabled.boolValue == true){
            ingredientes.append("Pimiento")
        }
        if (anchoaSw.enabled.boolValue == true){
            ingredientes.append("Anchoa")
        }
        
        if (segue.identifier == "ingredientesToConfirmacion") {
            let svc = segue.destinationViewController as ConfirmacionViewController;
            println("if (segue.identifier == ingredientesToConfirmacion)")

            svc.toPassTamano = toPassTamano
            svc.toPassMasa = toPassMasa
            svc.toPassQueso = toPassQueso
            
            

            svc.toPassIngredientes = ingredientes
            println("Ingredientes.count: \(ingredientes.count)")

            if (ingredientes.count == 0){
                let alertController = UIAlertController(title: "Pizzea", message:
                            "Mínimo un ingrediente", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default,handler: nil))

            }

            
        }else{
            println("else (segue.identifier == ingredientesToConfirmacion)")

        }
    }
    
    @IBAction func toConfirmacion(sender: AnyObject) {
        println("Ingredientes: \(ingredientes)")
        
        self.performSegueWithIdentifier("ingredientesToConfirmacion", sender:self)
        
//        if (ingredientes.count != 0){
//            println("Ingredientes: \(ingredientes)")
//
//            self.performSegueWithIdentifier("ingredientesToConfirmacion", sender:self)
//
//        }else{
//            let alertController = UIAlertController(title: "Pizzea", message:
//            "Mínimo un ingrediente", preferredStyle: UIAlertControllerStyle.Alert)
//            alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default,handler: nil))
//            
//            self.presentViewController(alertController, animated: true, completion: nil)
//        }
        
    }
}
