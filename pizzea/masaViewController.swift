//
//  masaViewController.swift
//  pizzea
//
//  Created by Fernando Ransanz on 14/11/15.
//  Copyright (c) 2015 Fernando Ransanz. All rights reserved.
//

import UIKit

class masaViewController: UIViewController {
    
   var  toPassTamano:String = ""

    @IBOutlet weak var masaPicker: UIPickerView!
    
    var masas = ["Delgada","Gruesa", "Crujiente"]
 var miMasa:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("Tamaño: \(toPassTamano)")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return masas.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        miMasa = masas[row]
        return masas[row]
    }

    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "masaToQueso") {
            let svc = segue.destinationViewController as QuesoViewController;
            
            svc.toPassTamano = toPassTamano
            svc.toPassMasa = miMasa
            
            
        }
    }
    
    @IBAction func toQueso(sender: AnyObject) {
        
        self.performSegueWithIdentifier("masaToQueso", sender:self)
    }


}
