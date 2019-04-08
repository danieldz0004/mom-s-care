//
//  SecondViewController.swift
//  mom's care
//
//  Created by Daniel Dz on 4/4/19.
//  Copyright © 2019 Daniel Dz. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBAction func infoButton(_ sender: Any) {
    }
    @IBOutlet weak var agePicker: UIPickerView!
    @IBOutlet weak var regionPicker: UIPickerView!
    
    var agePickerData: [String] = [String]()
    var regionPickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        regionPickerData = ["China", "Australia", "Test1", "Test2"]
        
        agePickerData = ["0-2","2-4","4-6", "6-8", "8-12"]
        
        self.agePicker.dataSource = self
        self.regionPicker.dataSource = self
        self.agePicker.delegate = self
        self.regionPicker.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == agePicker{
            return agePickerData.count
        }
        else{
            return regionPickerData.count
        }
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == agePicker{
            return agePickerData[row]
        }
        else{
            return regionPickerData[row]
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showVacInfo") {
            //Checking identifier is crucial as there might be multiple
            // segues attached to same view
            let vacVC = segue.destination as! VaccinationViewController;
            let selectedAgePicker = agePickerData[agePicker.selectedRow(inComponent: 0)]
            let selectedRegionPicker = regionPickerData[regionPicker.selectedRow(inComponent: 0)]
            vacVC.selection = selectedRegionPicker + selectedAgePicker
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
