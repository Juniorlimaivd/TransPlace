//
//  LocalViewController.swift
//  TransPlace
//
//  Created by Victor Augusto Pereira Porciúncula on 4/8/17.
//  Copyright © 2017 Junior Lima. All rights reserved.
//

import UIKit

class LocalViewController: UIViewController {
    
    //MARK: Properties


    @IBOutlet weak var segmentedPage: UISegmentedControl!
    @IBOutlet weak var negativeViewContainer: UIView!
    @IBOutlet weak var positiveViewContainer: UIView!
    @IBOutlet weak var overViewContainer: UIView!
    //@IBOutlet weak var rating: RatingControl!
    //@IBOutlet weak var tableView: UITableView!
    var comments = [Comment]()
    var tagName = ""
    @IBOutlet weak var navItem: UINavigationItem!
    //@IBOutlet weak var positiveBtn: UIBarButtonItem!
    //@IBOutlet weak var negativeBtn: UIBarButtonItem!

    
    
    
    let cellSpacingHeight: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setNegativeComments()
        tabBarController?.tabBar.isHidden = true
        
        overViewContainer.isHidden = false
        positiveViewContainer.isHidden = true
        negativeViewContainer.isHidden = true
        //tableView!.delegate = self
        //tableView!.dataSource = self
        //self.view .addSubview(tableView!)
        
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
}
