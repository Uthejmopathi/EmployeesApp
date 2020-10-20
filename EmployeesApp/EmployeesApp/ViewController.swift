//
//  ViewController.swift
//  EmployeesApp
//
//  Created by Uthej Mopathi on 10/20/20.
//

import UIKit

struct Details {
    var name: String
    var description: String
    var contactImage: String
    var emailID: String
    var phoneNumber: Int
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    var indexValue = 0
    var contactDetails: [Details?] = [Details(name: "Ashley",
                                              description: "iOS Developer",
                                              contactImage: "ronaldo",
                                              emailID: "ashley@gmail.com",
                                              phoneNumber: 1234567891),
                                      Details(name: "Brian",
                                              description: "Full Stack Developer",
                                              contactImage: "ronaldo",
                                              emailID: "brian@gmail.com",
                                              phoneNumber: 1234567892),
                                      Details(name: "Charlie",
                                              description: "UI Designer",
                                              contactImage: "ronaldo",
                                              emailID: "charlie@gmail.com",
                                              phoneNumber: 1234567893),
                                      Details(name: "TJ",
                                              description: "Senior iOS Developer",
                                              contactImage: "ronaldo",
                                              emailID: "tj@gmail.com",
                                              phoneNumber: 1234567894),
                                      Details(name: "Kerry",
                                              description: "Data Analyst",
                                              contactImage: "ronaldo",
                                              emailID: "kerry@gmail.com",
                                              phoneNumber: 1234567895)]
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell
        cell?.nameLabel.text = contactDetails[indexPath.row]?.name
        cell?.descriptionLabel.text = contactDetails[indexPath.row]?.description
        cell?.personImage.image = UIImage(named: contactDetails[indexPath.row]!.contactImage)
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexValue = indexPath.row
        performSegue(withIdentifier: "detailsPageSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? SecondViewController
        destinationVC?.nameFromFirstPage = contactDetails[indexValue]?.name
        destinationVC?.imageFromFirstPage = contactDetails[indexValue]?.contactImage
        destinationVC?.descriptionFromFirstPage = contactDetails[indexValue]?.description
        destinationVC?.emailIDFromFirstPage = contactDetails[indexValue]?.emailID
        destinationVC?.phoneNumberFromFirstPage = contactDetails[indexValue]?.phoneNumber
    }
}


class TableViewCell: UITableViewCell{
    static let identifier = "FirstPageTableCells"
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var personImage: UIImageView!
}

