//
//  CharactersTableViewController.swift
//  StarWars
//
//  Created by Vladislav on 24.12.2021.
//

import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift


class CharactersTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // Table View's outlet
    @IBOutlet weak private var swTableView: UITableView!
    let cellid = "CustomCell"
    // Empty variable for model
    // Note: if you want to make var for non-massive response -> var swData: SwCharacter = []
    var swData: [SwCharacter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Standart TableView operations
        self.swTableView.delegate = self
        self.swTableView.dataSource = self
        
        // Register custom table cell's xib
        let cellNib = UINib(nibName: cellid, bundle: .main)
        self.swTableView.register(cellNib, forCellReuseIdentifier: cellid)
        
        // Calling function to get data
        getSW()
    }
    // Defining function using request handler
    private func getSW() {
        RequestHandler(path: "/people/")
            .newBaseURL("https://swapi.dev/api/")
            // Entering "folder" we need to get data from
            .jsonKey("results")
            .response { (model: [SwCharacter]?) in
                print(model)
                // getting data to our variable
                self.swData = try! model ?? []
                print(self.swData.count)
                // always call that so results will show on table
                self.swTableView.reloadData()
            }
    }
    // TableView Functions
    // Set amount of rows based on amount of data
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return swData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // Sets height of Row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0;//Choose your custom row height
    }
    // Displays information grabbed from swData in a custom cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = swTableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as? CustomCell {
            cell.customCellLabel?.text = self.swData[indexPath.row].name
            return cell
        }
        return UITableViewCell()
    }
}
