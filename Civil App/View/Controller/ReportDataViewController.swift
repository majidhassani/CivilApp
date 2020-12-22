//
//  ReportDataViewController.swift
//  Civil App
//
//  Created by saeed on 12/22/20.
//

import UIKit
import DatePicker

class ReportDataViewController: UIViewController {
    
    var imagePicker: UIImagePickerController!
    var selectedDate:String = ""{
        didSet{
            self.dateTextField.text = self.selectedDate
        }
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var positionTextField: UITextField!
    @IBOutlet weak var imageTake: UIButton!
    
    
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
    
    @IBAction func takePhoto(_ sender: Any) {
      
        let takeImageAlert = UIAlertController(title: "Take Image", message: "Take Image or Select Photo", preferredStyle: UIAlertController.Style.actionSheet)

        let takeImageAction = UIAlertAction(title: "Take Image", style: .default) { (action: UIAlertAction) in
            self.selectImageFrom(.camera)
        }
        let selectPhotoAction = UIAlertAction(title: "Select Photo", style: .default) { (action: UIAlertAction) in
            self.selectImageFrom(.photoLibrary)
        }


        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        takeImageAlert.addAction(takeImageAction)
        takeImageAlert.addAction(selectPhotoAction)
        takeImageAlert.addAction(cancelAction)
        self.present(takeImageAlert, animated: true, completion: nil)
    }
    

}

extension ReportDataViewController:UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    
    
    enum ImageSource {
        case photoLibrary
        case camera
    }
    
    func selectImageFrom(_ source: ImageSource){
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        switch source {
        case .camera:
            imagePicker.sourceType = .camera
        case .photoLibrary:
            imagePicker.sourceType = .photoLibrary
        }
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        imagePicker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("Image not found!")
            return
        }
        //imageTake.image = selectedImage
    }
}
