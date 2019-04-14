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
import Charts

class ThirdViewController: UIViewController {

    @IBOutlet weak var InfoButton: UIButton!


    @IBOutlet weak var barChartView: BarChartView!
    @IBAction func covInfoBtn(_ sender: Any) {
        let a:Int? = Int(postCodeField.text ?? "0")
        
        if a != nil{
            if a! >= 3000 && a! <= 4000{
                years = ["2011-12", "2012-13", "2013-14", "2014-15", "2015-16", "2016-17"]
                barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values:years)
                barChartView.xAxis.granularity = 1
                setChart(dataPoints: years, values: dataFromFirebaseArray[postCodeField.text!]! as [Double])
            }
            else{
                
            }
        }
        else{
            
        }
    }

    @IBOutlet weak var postCodeField: UITextField!
    var ref: DatabaseReference?
    var dataFromFirebaseArray = [String:[Double]]()
    var years: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barChartView.noDataText = "Please input your postcode above"
        
        InfoButton.layer.cornerRadius = 4
        
//        self.percentageLabel.text = ""
        
        Auth.auth().signIn(withEmail: "localhost@theshield.com", password: "4theshield.com")
        
        ref = Database.database().reference()
        
        
        ref?.child("Coverage").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? [String:[Double]]
            
            self.dataFromFirebaseArray.removeAll()
            
            self.dataFromFirebaseArray = value!
            
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
        postCodeField.layer.masksToBounds = true
        postCodeField.layer.cornerRadius = 12.0
        postCodeField.layer.borderWidth = 2.0
        postCodeField.layer.borderColor = UIColor.blue.cgColor
        postCodeField.placeholder = "Please Enter Your Postcode"
        postCodeField.clearButtonMode = .whileEditing
        
        // Do any additional setup after loading the view.
    }
    
    
    func setChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Percent full immunised (%)")
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
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
