//
//  OverviewContainerViewController.swift
//  TransPlace
//
//  Created by Junior Lima on 09/04/17.
//  Copyright © 2017 Junior Lima. All rights reserved.
//

import UIKit
import SwiftyStarRatingView

class OverviewContainerViewController: UIViewController {

    @IBOutlet weak var starView: SwiftyStarRatingView!
    override func viewDidLoad() {
        super.viewDidLoad()
        starView.maximumValue = 5
        starView.minimumValue = 0
        starView.value = 3
        starView.tintColor = #colorLiteral(red: 0.4970856905, green: 0.3023125529, blue: 0.9918896556, alpha: 1)
        starView.isEnabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
