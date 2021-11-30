//
//  WeightsViewController.swift
//  FitnessArena
//
//  Created by Akshay on 2021-11-25.
//

import UIKit

class WeightsViewController: UIViewController {

   
    
    
    //var name = ["Arms","Chest","Legs","Shoulders", "Back", "Abdominals"]
   // var img = ["Arms","Chest","Legs","Shoulders", "Back", "Abdominals"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // tableView.delegate = self
       // tableView.dataSource = self
    }
}
//extension WeightsViewController: UITableViewDelegate, UITableViewDataSource {
//
//
//     func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return name.count
//    }
//
//
//     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeightsTableViewCell
//
//        // Configure the cell...
//
//
//        cell.lblWeight.text = self.name[indexPath.row]
//         cell.imgWeight.image = UIImage(named: name[indexPath.row])
//
//        return cell
//    }
//}
