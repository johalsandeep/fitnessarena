//
//  NutritionDetailViewController.swift
//  FitnessArena
//
//  Created by Akshay on 2021-11-25.
//

import UIKit

class NutritionDetailViewController: UIViewController {

    
    @IBOutlet weak var nutritionLabel: UILabel!
    @IBOutlet weak var nutritionDetails: UITextView!
    
    
    var nutritionName = ""
    var nutritiondetails = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nutritionLabel.text = nutritionName
        nutritionLabel.font = nutritionLabel.font.withSize(38)
        nutritionDetails.text = nutritiondetails
        nutritionDetails.font = nutritionDetails.font?.withSize(16)
    }
    


}
