//
//  HomeViewController.swift
//  StarWars
//
//  Created by Vladislav on 24.12.2021.
//

import UIKit
import FirebaseDatabase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Adding child branches to firebase as well as setting values/ AKA Writing data
        // Possible to comment out these lines since we have info in database already. Just want to show how I did it in the first place
        Database.database().reference().child("Vlad").child("Movie").setValue("Oldeuboi")
        Database.database().reference().child("Vlad").child("Anime").setValue("Fullmetal Alchemist: Brotherhood")
        Database.database().reference().child("Danil").child("Movie").setValue("No Country For Old Men")
        Database.database().reference().child("Danil").child("Anime").setValue("Evangelion")
        Database.database().reference().child("German").child("Movie").setValue("Something you've never heard of")
        Database.database().reference().child("German").child("Anime").setValue("Welcome to NHK")

        // Reading data
        // snapshot allows us to store data how we want and guard let helps to check if value is present and work with error handling
        Database.database().reference().observe(.value) { (snapshot) in
            guard let value = snapshot.value, snapshot.exists() else {
                print("Error with getting data")
                return
            }
            
            print("value: \(value)")
        }
    }
    @IBAction private func charListAButtonAction(_ sender: Any) {
        let nextVC = CharactersTableViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
