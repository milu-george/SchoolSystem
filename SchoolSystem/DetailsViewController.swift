//
//  DetailsViewController.swift
//  SchoolSystem
//
//  Created by Milu Ann George on 23/01/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var customLabel: UILabel!
}

class DetailsViewController: UIViewController {
    
    var personName: String = ""
    var personAge: Int16 = 0
    var personId: Int32 = 0
    var personRole: String = ""
    var personGender: String = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "Details"
    }
}

extension DetailsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell

        // Configure the cell's UI elements based on the cell's index
        switch indexPath.row {
        case 0:
            let idLabel = (personRole.lowercased() == "student") ? "Roll no" : "Emp Id"
            cell.customLabel.text = "\(idLabel): \(personId)"
        case 1:
            cell.customLabel.text = "Name: \(personName)"
        case 2:
            cell.customLabel.text = "Age: \(personAge)"
        case 3:
            cell.customLabel.text = "Gender: \(personGender)"
        case 4:
            cell.customLabel.text = "Role: \(personRole)"
        default:
            break
        }

        return cell
    }
}
