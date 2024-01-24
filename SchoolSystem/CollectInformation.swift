//
//  CollectInformation.swift
//  SchoolSystem
//
//  Created by Milu Ann George on 23/01/24.
//

import UIKit
import CoreData

protocol CollectorVCDelegate {
    func dataSaved()
}

class CollectInformation: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var genderSegmentView: UISegmentedControl!
    
    @IBOutlet weak var roleSegmentView: UISegmentedControl!
    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var ageOutlet: UITextField!
    @IBOutlet weak var idOutlet: UITextField!
   
    @IBOutlet weak var saveButton: UIButton!
    var transitionDelegate: CollectorVCDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = " Add Person"
        self.nameOutlet.delegate = self
        self.ageOutlet.delegate = self
        self.idOutlet.delegate = self
        
        // Add observers for text field changes
            nameOutlet.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            ageOutlet.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            idOutlet.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            
            // Initially, disable the button
            saveButton.isEnabled = false

    }
    
    @objc func textFieldDidChange() {
        // Check if all text fields have text
        guard let name = nameOutlet.text, !name.isEmpty,
              let ageText = ageOutlet.text, !ageText.isEmpty,
              let idText = idOutlet.text, !idText.isEmpty else {
            saveButton.isEnabled = false
            return
        }
        
        // Enable the button if all fields have text
        saveButton.isEnabled = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func btnOnTap(_ sender: Any) {
        // Perform input validation
        guard let name = nameOutlet.text, !name.isEmpty,
              let ageText = ageOutlet.text, let age = Int(ageText),
              let idText = idOutlet.text, let id = Int(idText) else {
            showAlert(message: "Please fill in all required fields.")
            return
        }
        
        var selectedGenderIndex = genderSegmentView.selectedSegmentIndex
        var selectedRoleIndex = roleSegmentView.selectedSegmentIndex
        
        // Validate the selected role index
        if selectedRoleIndex == UISegmentedControl.noSegment  {
            selectedRoleIndex = 0
        }
        
        // Validate the selected gender index
        if selectedGenderIndex == UISegmentedControl.noSegment {
            selectedGenderIndex = 0
        }
        
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let person = Person(context: context)
                
                person.name = name
                person.age = Int16(age)
                
                if selectedGenderIndex == 0 {
                    person.gender = "Male"
                }
                else if selectedGenderIndex == 1{
                    person.gender = "Female"
                }
                else{
                    person.gender = "Other"
                }
                
                if selectedRoleIndex == 0 { // teacher
                    let teacher = Teacher(context: context)
                    teacher.empID = Int32(id)
                    person.teacher = teacher
                } else { // student
                    let student = Student(context: context)
                    student.rollNo = Int32(id)
                    person.student = student
                }
                
                
                do {
                    try context.save()
                    print("Data saved to Core Data")
                    navigationController?.popViewController(animated: true)
                    if let transitionDelegate = transitionDelegate {
                        transitionDelegate.dataSaved()
                    }
                } catch {
                    print("Error saving to Core Data: \(error)")
                }
        }
            
            private func showAlert(message: String) {
                let alertController = UIAlertController(
                    title: "Validation Error",
                    message: message,
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                
                present(alertController, animated: true, completion: nil)
            }
        }
    
