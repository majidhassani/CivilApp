//
//  ReportDataViewController.swift
//  Civil App
//
//  Created by saeed on 12/22/20.
//

import UIKit
import DatePicker

class ReportDataViewController: UIViewController {
    
    var selectedDate:String = ""{
        didSet{
            self.dateTextField.text = self.selectedDate
        }
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var positionTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func datePress(_ sender: UIButton) {
        let minDate = DatePickerHelper.shared.dateFrom(day: 18, month: 08, year: 1990)!
        let maxDate = DatePickerHelper.shared.dateFrom(day: 18, month: 08, year: 2030)!
        let today = Date()
        let datePicker = DatePicker()
        datePicker.setup(beginWith: today, min: minDate, max: maxDate) { (selected, date) in
            if selected, let selectedDate = date {
                self.selectedDate = selectedDate.string()
            } else {
            }
        }
        datePicker.show(in: self, on: sender)
        
    }
    


}
