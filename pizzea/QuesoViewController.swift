//
//  QuesoViewController.swift
//  pizzea
//
//  Created by Fernando Ransanz on 15/11/15.
//  Copyright (c) 2015 Fernando Ransanz. All rights reserved.
//

import UIKit

class QuesoViewController: UIViewController {
    
     var  toPassTamano:String = ""
     var  toPassMasa:String = ""

    @IBOutlet weak var tituloLbl: UILabel!
    
    @IBOutlet weak var quesoLbl: UILabel!
    
    @IBOutlet weak var quesoPicker: UIPickerView!
    
    var quesos = ["Mozzarella","Chedar", "Parmesano", "Sin queso"]
    var miQueso:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Tamaño: \(toPassTamano)")
        println("Masa: \(toPassMasa)")
        // Do any additional setup after loading the view, typically from a nib.
        tituloLbl.adjustsFontSizeToFitWidth = true
        tituloLbl.sizeToFit()
        quesoLbl.adjustsFontSizeToFitWidth = true
        quesoLbl.sizeToFit()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return quesos.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        miQueso = quesos[row]
        return quesos[row]
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "quesoToIngredientes") {
            let svc = segue.destinationViewController as IngredientesViewController;
            
            svc.toPassTamano = toPassTamano
            svc.toPassMasa = toPassMasa
            svc.toPassQueso = miQueso
            
        }
    }
    
    @IBAction func toIngredientes(sender: AnyObject) {
        
        self.performSegueWithIdentifier("quesoToIngredientes", sender:self)
    }

}
