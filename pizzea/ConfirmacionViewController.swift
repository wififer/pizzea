//
//  ConfirmacionViewController.swift
//  pizzea
//
//  Created by Fernando Ransanz on 15/11/15.
//  Copyright (c) 2015 Fernando Ransanz. All rights reserved.
//

import UIKit

class ConfirmacionViewController: UIViewController {
    
   var toPassIngredientes:[String] = []
    var  toPassTamano:String = ""
    var  toPassMasa:String = ""
    var  toPassQueso:String = ""
    var ingredientes2:String = ""

    @IBOutlet weak var ingredientesLbl: UILabel!
    @IBOutlet weak var quesoLbl: UILabel!
    @IBOutlet weak var masaLbl: UILabel!
    @IBOutlet weak var tamanoLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("toPassIngredientes: \(toPassIngredientes)")
        
        for v in toPassIngredientes {
           self.ingredientes2 += "\n\(v)"

        }
        ingredientesLbl.text = "Ingredientes: \(self.ingredientes2)"
        quesoLbl.text = "Queso: \(toPassQueso)"
        masaLbl.text = "Masa: \(toPassMasa)"
        tamanoLbl.text = "Tamaño: \(toPassTamano)"


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
