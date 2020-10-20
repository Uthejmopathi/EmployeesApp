//
//  SecondViewController.swift
//  EmployeesApp
//
//  Created by Uthej Mopathi on 10/20/20.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var personsImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var nameFromFirstPage: String?
    var imageFromFirstPage: String?
    var descriptionFromFirstPage : String?
    var emailIDFromFirstPage: String?
    var phoneNumberFromFirstPage: Int?
    
    var leftLabelsData = ["Name","Description","Email","Phone"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personsImage.image = UIImage(named: imageFromFirstPage!)

        // Do any additional setup after loading the view.
    }
    

}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.identifier, for: indexPath) as? SecondTableViewCell
        if indexPath.section == 0{
        cell?.rightLabel.text = nameFromFirstPage
        cell?.leftLabel.text = leftLabelsData[indexPath.row]
        return cell!
        }
        else if indexPath.section == 1{
            cell?.rightLabel.text = descriptionFromFirstPage
            cell?.leftLabel.text = leftLabelsData[indexPath.section]
            return cell!
            }
        else if indexPath.section == 2 {
            cell?.rightLabel.text = emailIDFromFirstPage
            cell?.leftLabel.text = leftLabelsData[indexPath.section]
            return cell!
            }
        else if indexPath.section == 3 {
            cell?.rightLabel.text = String(phoneNumberFromFirstPage!)
            cell?.leftLabel.text = leftLabelsData[indexPath.section]
            return cell!
            }
        else{
            cell?.rightLabel.text = descriptionFromFirstPage
            cell?.leftLabel.text = leftLabelsData[indexPath.section]
            return cell!
        }

    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Name"
        case 1:
            return "Description"
        case 2:
            return "Email"
        default:
            return "Phone"
        }
    }
    
    
}

class SecondTableViewCell: UITableViewCell{
    static let identifier = "SecondPageCells"
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
}
