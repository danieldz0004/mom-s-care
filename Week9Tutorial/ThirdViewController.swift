//
//  ThirdViewController.swift
//  mom's care
//
//  Created by Daniel Dz on 4/4/19.
//  Copyright © 2019 Daniel Dz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ThirdViewController: UIViewController {

    @IBAction func covInfoBtn(_ sender: Any) {
        let a:Int? = Int(postCodeField.text ?? "0")
        
        if a != nil{
            if a! >= 3000 && a! <= 4000{
                self.percentageLabel.text = dataFromFirebaseArray[postCodeField.text! as String]! + "%"
            }
            else{
                self.percentageLabel.text = "No Data"
            }
        }
        else{
            self.percentageLabel.text = "No Data"
        }
    }
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var postCodeField: UITextField!
    var ref: DatabaseReference?
    var dataFromFirebaseArray = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.percentageLabel.text = "???"
        
        Auth.auth().signIn(withEmail: "localhost@theshield.com", password: "4theshield.com")
        
        ref = Database.database().reference()
        
        
        ref?.child("coverage").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? [String:String]
            
            self.dataFromFirebaseArray.removeAll()
            
            self.dataFromFirebaseArray = value!
            
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
        postCodeField.layer.masksToBounds = true
        postCodeField.layer.cornerRadius = 12.0
        postCodeField.layer.borderWidth = 2.0
        postCodeField.layer.borderColor = UIColor.red.cgColor
        postCodeField.placeholder = "Please Enter Your Postcode"
        postCodeField.clearButtonMode = .whileEditing
        
        
        // Do any additional setup after loading the view.
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
