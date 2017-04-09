//
//  LocalViewController.swift
//  TransPlace
//
//  Created by Victor Augusto Pereira Porciúncula on 4/8/17.
//  Copyright © 2017 Junior Lima. All rights reserved.
//

import UIKit
import Firebase
import Firebase
import SwiftyJSON

class LocalViewController: UIViewController {
    
    //MARK: Properties


    @IBOutlet weak var segmentedPage: UISegmentedControl!
    @IBOutlet weak var negativeViewContainer: UIView!
    @IBOutlet weak var positiveViewContainer: UIView!
    @IBOutlet weak var overViewContainer: UIView!
    var ref: FIRDatabaseReference!
    @IBOutlet weak var imagePlace: UIImageView!
    @IBOutlet weak var streetNumberLabel: UILabel!
    @IBOutlet weak var cityStateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    
    //@IBOutlet weak var rating: RatingControl!
    //@IBOutlet weak var tableView: UITableView!
    var comments = [Comment]()
    var tagName = ""
    @IBOutlet weak var navItem: UINavigationItem!
    //@IBOutlet weak var positiveBtn: UIBarButtonItem!
    //@IBOutlet weak var negativeBtn: UIBarButtonItem!
    var placeId:Int = 0
    
    
    
    let cellSpacingHeight: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setNegativeComments()
         ref = FIRDatabase.database().reference()
        tabBarController?.tabBar.isHidden = true
        
        overViewContainer.isHidden = false
        positiveViewContainer.isHidden = true
        negativeViewContainer.isHidden = true
        //tableView!.delegate = self
        //tableView!.dataSource = self
        //self.view .addSubview(tableView!)
        
        fetchPlaceInfo(callback: {
            place in
            self.nameLabel.text = place.name
            (self.overViewContainer as? OverviewContainerViewController)?.starView.value = CGFloat(place.rating)
            self.streetNumberLabel.text = "\(place.address.street), \(place.address.number)"
            self.cityStateLabel.text = "\(place.address.city) - \(place.address.state)"
            self.imagePlace.image = UIImage(named: "imageLocal\(self.placeId)")
        })
        
        // navbar tittle
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor(red: 106.0/255, green: 43.0/255, blue: 252.0/255, alpha: 1.0)]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict as! [String : Any]
        
        // buttons
        //positiveBtn.tintColor = UIColor(red: 106.0/255, green: 43.0/255, blue: 252.0/255, alpha: 1.0)
        //negativeBtn.tintColor = UIColor(red: 106.0/255, green: 43.0/255, blue: 252.0/255, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentedControlChanged(_ sender: Any) {
        
        if segmentedPage.selectedSegmentIndex == 0 {
            overViewContainer.isHidden = false
            positiveViewContainer.isHidden = true
            negativeViewContainer.isHidden = true
            
        } else if segmentedPage.selectedSegmentIndex == 1 {
            overViewContainer.isHidden = true
            positiveViewContainer.isHidden = false
            negativeViewContainer.isHidden = true
            
        } else if segmentedPage.selectedSegmentIndex == 2 {
            overViewContainer.isHidden = true
            positiveViewContainer.isHidden = true
            negativeViewContainer.isHidden = false
        }
    }
    
    func makeSegue(_ tag:String) {
        tagName = tag
        performSegue(withIdentifier: "TagDescriptionSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TagDescriptionSegue" {
            let dest = segue.destination as! DescriptionViewController
            
            dest.tagName = tagName
            
        }
    }
    
    private func fetchPlaceInfo(callback: @escaping (Place) -> ()) -> ()  {
        
        ref.child("places").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            let json = JSON(snapshot.value)
            
                var place = Place(name: "--", address: Address(city:"--", number:"--", additional:"--", state:"--", street:"--", zipCode:"--"), rating: 0)
            
                place.name = json[self.placeId]["name"].string!
                place.rating = json[self.placeId]["ratingPoints"].int!
                place.address.city = json[self.placeId]["address"]["city"].string!
                place.address.number = json[self.placeId]["address"]["number"].string!
                place.address.street = json[self.placeId]["address"]["street"].string!
                place.address.state = json[self.placeId]["address"]["state"].string!
                place.address.additional = json[self.placeId]["address"]["additional"].string!
                place.address.zipCode = json[self.placeId]["address"]["zipcode"].string!
            
            callback(place)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
}
