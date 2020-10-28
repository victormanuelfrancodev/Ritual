import UIKit
import os.log

class TaskDetailsViewController: UIViewController {
  
  @IBOutlet var descriptionTextField: UITextField!
  @IBOutlet var notesTextField: UITextField!
  @IBOutlet var saveButton: UIBarButtonItem!
  
  var task: Task?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    descriptionTextField.delegate = self
    if let task = task {
      descriptionTextField.text = task.description
      notesTextField.text = task.notes
    }
    
    updateSaveButtonState()
  }
  
  // MARK: - Navigation
  @IBAction func cancel(_ sender: UIBarButtonItem) {
    let isPresentingInAddTaskMode = presentingViewController is UINavigationController
    if isPresentingInAddTaskMode {
      dismiss(animated: true, completion: nil)
    } else if let owningNavigationController = navigationController {
      owningNavigationController.popViewController(animated: true)
    } else {
      fatalError("The MealViewController is not inside a navigation controller.")
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    guard let button = sender as? UIBarButtonItem, button === saveButton else {
      os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
      return
    }
    
    let description = descriptionTextField.text ?? ""
    let notes = notesTextField.text ?? ""
    
    task = Task(description: description, notes: notes)
  }
}

extension TaskDetailsViewController: UITextFieldDelegate {
  //MARK: UITextFieldDelegate
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    updateSaveButtonState()
    navigationItem.title = textField.text
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    saveButton.isEnabled = false
  }
  
  //MARK: Private methods  
  func updateSaveButtonState() {    
    let description = self.descriptionTextField.text ?? ""
    saveButton.isEnabled = !description.isEmpty
  }
}
