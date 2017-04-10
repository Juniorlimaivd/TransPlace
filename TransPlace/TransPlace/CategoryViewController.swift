//
//  CategoryViewController.swift
//  TransPlace
//
//  Created by Junior Lima on 08/04/17.
//  Copyright © 2017 Junior Lima. All rights reserved.
//

import UIKit
import SwiftyStarRatingView
import Firebase
import SwiftyJSON

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var categoryTableView: UITableView!
    var scope : String! = ""
    var places = [Place]()
    var ref: FIRDatabaseReference!
    var rowSelected: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Locals"
        
        fetchPlaceInfo(callback: {
            places in
                self.places = places
                print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
                print(places[0].name)
                self.categoryTableView.reloadData()
        })
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
        categoryTableView.separatorColor = UIColor.lightGray
        categoryTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: categoryTableView.frame.width, height: 20))
        if scope != "" {
            if scope == "Lunch" {
                searchBar.selectedScopeButtonIndex = 1
            } else if scope == "Enterprise" {
                searchBar.selectedScopeButtonIndex = 2
            } else if scope == "NightLife" {
                searchBar.selectedScopeButtonIndex = 3
            } else if scope == "Fun" {
                searchBar.selectedScopeButtonIndex = 4
            }
            
            
        }
        
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryTableView.dequeueReusableCell(withIdentifier: "localCell") as? CategoryTableViewCell
        
        let place = places[indexPath.row]
        
        cell?.starView.value = CGFloat(place.rating)
        cell?.name.text = place.name
        cell?.streetNumber.text = "\(place.address.street), \(place.address.number)"
        cell?.cidadeEstado.text = "\(place.address.city) - \(place.address.state)"
        let selectImage = "imageLocal\(indexPath.row)"
        cell?.imagePlace.image = UIImage(named: selectImage)
//        print(place.imageAdress)
//        let url = URL(string: place.imageAdress)
//        DispatchQueue.global().async {
//            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
//            DispatchQueue.main.async {
//                cell?.imagePlace.image = UIImage(data: data!)
//            }
//        }

        
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.rowSelected = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "LocalSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "LocalSegue") {
            var viewController = segue.destination as? LocalViewController
            viewController?.placeId = self.rowSelected
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func fetchPlaceInfo(callback: @escaping ([Place]) -> ()) -> ()  {
        
        ref.child("places").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            let json = JSON(snapshot.value)
            
            var places = [Place]()
            
            for index in 0...4 {
                var place = Place(name: "--", address: Address(city:"--", number:"--", additional:"--", state:"--", street:"--", zipCode:"--"), rating: 0)
                
                place.name = json[index]["name"].string!
                place.rating = json[index]["ratingPoints"].int!
                place.address.city = json[index]["address"]["city"].string!
                place.address.number = json[index]["address"]["number"].string!
                place.address.street = json[index]["address"]["street"].string!
                place.address.state = json[index]["address"]["state"].string!
                place.address.additional = json[index]["address"]["additional"].string!
                place.address.zipCode = json[index]["address"]["zipcode"].string!
                place.imageAdress = json[index]["image"].string!
                
                
               
                places.append(place)
            }
            callback(places)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }


}
