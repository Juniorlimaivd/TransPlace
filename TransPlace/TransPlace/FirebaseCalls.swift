//
//  FirebaseCalls.swift
//  TransPlace
//
//  Created by Victor Augusto Pereira Porciúncula on 4/9/17.
//  Copyright © 2017 Junior Lima. All rights reserved.
//

import Foundation
import Firebase
import SwiftyJSON

class FirebaseCalls {
    
    var ref: FIRDatabaseReference!
    
    init?() {
        ref = FIRDatabase.database().reference()
    }
    
//    func fetchPlaceByName(name: String, callback: @escaping (Place) -> ()) -> ()  {
//       
//        ref.child("places").observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//            var place = Place(name: "--", address: Address(city:"--", number:"--", additional:"--", state:"--", street:"--", zipCode:"--"), rating: 0)
//            let value = snapshot.value as? NSDictionary
//            for anItem in snapshot.value as! [Dictionary<String, AnyObject>] {
//                if (anItem["name"]!) as! String == name {
//                    for (index, element) in (anItem["address"]! as? NSDictionary)!.enumerated() {
//                        if(index == 0) {
//                            place.address.number = (element.value as! String)
//                        } else if(index == 1) {
//                            place.address.additional = (element.value as! String)
//                        } else if(index == 2) {
//                            place.address.state = (element.value as! String)
//                        } else if(index == 3) {
//                            place.address.city = (element.value as! String)
//                        } else if(index == 4) {
//                            place.address.street = (element.value as! String)
//                        } else if(index == 5) {
//                            place.address.zipCode = (element.value as! String)
//                        }
//                    }
//                    print((anItem["categories"]! as? String)!)
//                    for (index, element) in (anItem["categories"]! as? NSDictionary)!.enumerated() {
//                        place.categories.append((element.value as! String))
//                    }
//                    place.name = anItem["name"]! as! String
//                    //place.address = address
//                    place.rating = Int(anItem["ratingPoints"]! as! NSNumber)
//                }
//            }
//            
//            callback(place)
//            
//            // ...
//        }) { (error) in
//            print(error.localizedDescription)
//        }
//        
//    }

    func fetchPlaceByName(name: String, callback: @escaping (Place) -> ()) -> ()  {
        
        ref.child("places").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            var place = Place(name: "--", address: Address(city:"--", number:"--", additional:"--", state:"--", street:"--", zipCode:"--"), rating: 0)
            let value = snapshot.value as? NSDictionary
            let json = JSON(snapshot.value)
            
            place.name = json[0]["name"].string!
            place.rating = Int(json[0]["ratingPoints"]  as! NSNumber)
            place.address.city = json[0]["city"].string!
            place.address.number = json[0]["number"].string!
            place.address.street = json[0]["street"].string!
            place.address.state = json[0]["state"].string!
            place.address.additional = json[0]["additional"].string!
            place.address.zipCode = json[0]["zipcode"].string!
            
            callback(place)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }

    
//    func fetchPlaceById(id: String, callback: @escaping (Place) -> ()) -> ()  {
//        
//        ref.child("places").child("0").observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//            var place = Place(name: "--", address: Address(city:"--", number:"--", additional:"--", state:"--", street:"--", zipCode:"--"), rating: 0)
//            let value = snapshot.value as? NSDictionary
//            place.name = value?["name"] as? String ?? ""
//            place.rating = Int(value?["ratingPoints"]! as! NSNumber)
//            for (index, element) in (value?["address"]! as? NSDictionary)!.enumerated() {
//                if(index == 0) {
//                    place.address.number = (element.value as! String)
//                } else if(index == 1) {
//                    place.address.additional = (element.value as! String)
//                } else if(index == 2) {
//                    place.address.state = (element.value as! String)
//                } else if(index == 3) {
//                    place.address.city = (element.value as! String)
//                } else if(index == 4) {
//                    place.address.street = (element.value as! String)
//                } else if(index == 5) {
//                    place.address.zipCode = (element.value as! String)
//                }
//            }
//            
//            callback(place)
//            
//            // ...
//        }) { (error) in
//            print(error.localizedDescription)
//        }
//        
//    }

    
    func fetchPlaceById(id: String, callback: @escaping (Place) -> ()) -> ()  {
        
        ref.child("places").child("0").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            var place = Place(name: "--", address: Address(city:"--", number:"--", additional:"--", state:"--", street:"--", zipCode:"--"), rating: 0)
            let value = snapshot.value as? NSDictionary
            place.name = value?["name"] as? String ?? ""
            place.rating = Int(value?["ratingPoints"]! as! NSNumber)
            for (index, element) in (value?["address"]! as? NSDictionary)!.enumerated() {
                if(index == 0) {
                    place.address.number = (element.value as! String)
                } else if(index == 1) {
                    place.address.additional = (element.value as! String)
                } else if(index == 2) {
                    place.address.state = (element.value as! String)
                } else if(index == 3) {
                    place.address.city = (element.value as! String)
                } else if(index == 4) {
                    place.address.street = (element.value as! String)
                } else if(index == 5) {
                    place.address.zipCode = (element.value as! String)
                }
            }
            
            callback(place)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }

    
    
    
}
