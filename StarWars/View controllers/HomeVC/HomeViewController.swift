//
//  HomeViewController.swift
//  StarWars
//
//  Created by Vladislav on 24.12.2021.
//

import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction private func charListAButtonAction(_ sender: Any) {
        let nextVC = CharactersTableViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
