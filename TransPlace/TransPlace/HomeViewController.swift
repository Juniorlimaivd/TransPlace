//
//  HomeViewController.swift
//  TransPlace
//
//  Created by Junior Lima on 08/04/17.
//  Copyright © 2017 Junior Lima. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    

    @IBOutlet weak var searchBarButton: UIButton!
  
    var chooseCategory : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        searchBarButton.layer.cornerRadius = 5.0
        searchBarButton.layer.shadowColor = UIColor.black.cgColor
        searchBarButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        searchBarButton.layer.shadowRadius = 3
        searchBarButton.layer.shadowOpacity = 0.25
        searchBarButton.setTitle("Pesquise lugares inclusivos", for: .normal)
        searchBarButton.titleEdgeInsets = UIEdgeInsets(top: 0.0,
                                                       left: 10.0 + (searchBarButton.imageView?.frame.width)! ,
                                                       bottom: 0.0,
                                                       right: 0.0)
        searchBarButton.setTitleColor(UIColor.lightGray, for: .normal)
        searchBarButton.imageRect(forContentRect: CGRect(x: 0,
                                                         y: 0,
                                                         width: (searchBarButton.imageView?.frame.width)!,
                                                         height: (searchBarButton.imageView?.frame.height)!))
        searchBarButton.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 0.0)
        
     
        
        
        

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func goToLunchCategory(_ sender: Any) {
        chooseCategory = "Lunch"
        performSegue(withIdentifier: "CategorySegue", sender: self)
    }
    
    @IBAction func goToEnterprise(_ sender: Any) {
        chooseCategory = "Enterprise"
        performSegue(withIdentifier: "CategorySegue", sender: self)
    }
    @IBAction func goToNightLife(_ sender: Any) {
        chooseCategory = "NightLife"
        performSegue(withIdentifier: "CategorySegue", sender: self)
    }
    @IBAction func goToFun(_ sender: Any) {
        chooseCategory = "Fun"
        performSegue(withIdentifier: "CategorySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CategorySegue" {
            let dest = segue.destination as! CategoryViewController
            dest.scope = chooseCategory
        }
    }
    
}

extension UIView {
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
}
