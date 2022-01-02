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
    private let cellid = "CustomCell"
    // Note: if you want to make var for non-massive response -> var DataSource: SwCharacter = []
    // Empty variable for model to transfer data from class
    private var dataSource: [SwCharacter] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Standart TableView operations
        swTableView.delegate = self
        swTableView.dataSource = self
        
        // Register custom table cell's xib
        let cellNib = UINib(nibName: cellid, bundle: .main)
        swTableView.register(cellNib, forCellReuseIdentifier: cellid)
        
        //Using singleton pattern
        SwManager.shared.getSW { (savedCharacters) in
            // assigning  cached value we got to empty variable we created here
            self.dataSource = savedCharacters
            // always do that so your data actually gets displayed
            self.swTableView.reloadData()
            // just checking function's order of execution for myself
            print("Data reload")
        }
    }
   
    // TableView Functions
    // Set amount of rows based on amount of data
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // Sets height of Row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0;//Choose your custom row height
    }
    // Displays information grabbed from swData in a custom cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        // declaring model for cell
        let cellModel = dataSource[indexPath.row]
        if let cell = swTableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as? CustomCell {
        // calling update method to cell it assigns label to SwCharacter name
        cell.update(with: cellModel)
          }
        return UITableViewCell()
    }
}
