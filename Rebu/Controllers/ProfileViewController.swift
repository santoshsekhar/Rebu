//
//  ProfileViewController.swift
//  Rebu
//
//  Created by Kelsie Dibben on 11/5/18.
//  Copyright © 2018 Jennaikode,Vamshi Raj. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    

//    var user:User! = User(user_id: "batman",firstName: "bruce", lastName: "alloy",email:"bat@cave.com", password: "batMobile", mobile: 6605280403,dob: "12/08/1988",address: Address(firstLine: "1115 N College Drive",city: "Maryville", state: "MO", zip: 64468))
    
    @IBOutlet weak var firstNameLBL: UILabel!
    
    @IBOutlet weak var lastNameLBL: UILabel!
    
    @IBOutlet weak var emailLBL: UILabel!
    
    @IBOutlet weak var phoneLBL: UILabel!
    
    @IBOutlet weak var addressLBL: UILabel!
    
    @IBOutlet weak var addressLine2LBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpeg")!)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        firstNameLBL.text = Backendless.sharedInstance()?.userService.currentUser.getProperty("name") as? String
        emailLBL.text = Backendless.sharedInstance()?.userService.currentUser.getProperty("email") as? String
        phoneLBL.text = Backendless.sharedInstance()?.userService.currentUser.getProperty("mobile") as? String
        addressLBL.text = Backendless.sharedInstance()?.userService.currentUser.getProperty("address") as? String
        addressLine2LBL.text = ("\(Backendless.sharedInstance()?.userService.currentUser.getProperty("city") as! String), \(Backendless.sharedInstance()?.userService.currentUser.getProperty("state") as! String) \(Backendless.sharedInstance()?.userService.currentUser.getProperty("zip") as! String)")
    }

    @IBAction func logOutBTN(_ sender: Any) {
        Backendless.sharedInstance()!.userService.logout()
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
