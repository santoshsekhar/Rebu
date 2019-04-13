//
//  PostAnouncementViewController.swift
//  Rebu
//
//  Created by SANTOSH SEKHAR M B on 11/26/18.
//  Copyright © 2018 Jennaikode,Vamshi Raj. All rights reserved.
//

import UIKit

class PostAnouncementViewController: UIViewController {
    @IBOutlet weak var anounceNameTXT: UITextField!
    

    @IBOutlet weak var startPointTXT: UITextField!
    
    @IBOutlet weak var endPointTXT: UITextField!
    
    @IBOutlet weak var contactTXT: UITextField!
    
    @IBOutlet weak var extraInfoTXT: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpeg")!)
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    func display(msg: String) {
        let alert = UIAlertController(title: "Failed", message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

    }
    func displayAlert(msg: String){
        let  alert  =  UIAlertController(title:  "Announcement",  message: msg,  preferredStyle:  .alert)
        alert.addAction(UIAlertAction(title:  "OK",  style:  .default,  handler:  { _ in
            self.performSegue(withIdentifier: "post", sender: nil)
        }))
        self.present(alert,  animated:  true,  completion:  nil)    }

    
    @IBAction func postAnouncement(_ sender: Any) {
        if let name = anounceNameTXT.text, let startPoint = startPointTXT.text, let endPoint = endPointTXT.text , let contact = contactTXT.text, let extraInfo = extraInfoTXT.text
            
        {
            //var data:Anouncement
            if !name.isEmpty && !startPoint.isEmpty && !endPoint.isEmpty && !contact.isEmpty {
                if Anouncements.anounce.rideSelect == "Take" // perform action based on type of ride selected
                {
                        Anouncements.anounce.saveTakeRideAnouncements(name: name, startPoint: startPoint, endPoint: endPoint, contact: contact, extra: extraInfo)
                    self.displayAlert(msg: "Posted!!")
                    
                }
                    
                else
                    
                {
                    Anouncements.anounce.saveGiveRideAnouncements(name: name, startPoint: startPoint, endPoint: endPoint, contact: contact, extra: extraInfo)
                    self.displayAlert(msg: "Posted!!")
                }

            }
    else {
                self.display(msg: "Enter All required fields")
            }
        }
    
    
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
