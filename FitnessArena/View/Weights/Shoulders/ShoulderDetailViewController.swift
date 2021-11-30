//
//  ShoulderDetailViewController.swift
//  FitnessArena
//
//  Created by Akshay on 2021-11-27.
//

import UIKit

class ShoulderDetailViewController: UIViewController {

    @IBOutlet weak var labeltxt: UILabel!
    @IBOutlet weak var detailList: UITextView!
    
    var name = ""
    var details = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labeltxt.text = name
        labeltxt.font = labeltxt.font.withSize(38)
        detailList.text = details
        detailList.font = detailList.font?.withSize(16)
        
    }
}
