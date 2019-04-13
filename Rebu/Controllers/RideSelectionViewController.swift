//
//  RideSelectionViewController.swift
//  Rebus
//
//  Created by SANTOSH SEKHAR M B on 10/21/18.
//  Copyright © 2018 Jennaikode,Vamshi Raj. All rights reserved.
//

import UIKit

class RideSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func takeRide(_ sender: Any) {
        
        Anouncements.anounce.rideSelect = "Take"
    }
    
    
    @IBAction func giveRide(_ sender: Any) {
        
        Anouncements.anounce.rideSelect = "Give"
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
