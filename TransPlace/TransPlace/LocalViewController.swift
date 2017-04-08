//
//  LocalViewController.swift
//  TransPlace
//
//  Created by Victor Augusto Pereira Porciúncula on 4/8/17.
//  Copyright © 2017 Junior Lima. All rights reserved.
//

import UIKit

class LocalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Properties

    @IBOutlet weak var placeLabelName: UILabel!
    @IBOutlet weak var newReviewButton: UIButton!
    @IBOutlet weak var rating: RatingControl!
    @IBOutlet weak var tableView: UITableView!
    var comments = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleComments()
        
        tableView!.delegate = self
        tableView!.dataSource = self
        
        self.view .addSubview(tableView!)
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
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    func tableView(_ tableView:UITableView, heightForRowAt indexPath:IndexPath)->CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CommentViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CommentViewCell  else {
            fatalError("The dequeued cell is not an instance of CommentViewCell.")
        }
        
        let comment = comments[indexPath.row]
        print(">>>>>>>>>>>>>>>>>>>>>>>> HERE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<")
        print(comment.userName)
//        cell.name.text = comment.userName
//        cell.rating.rating = comment.rating
//        if (comment.tags[0] == true) {
//            cell.tag1.text = "Diversidade"
//        } else if(comment.tags[3] == true) {
//            cell.tag1.text = "Racismo"
//        } else {
//            cell.tag1.text = ""
//        }
//        
//        if (comment.tags[1] == true) {
//            cell.tag2.text = "Conscientizador"
//        } else if(comment.tags[4] == true) {
//            cell.tag2.text = "Misoginia"
//        } else {
//            cell.tag2.text = ""
//        }
//        
//        if (comment.tags[2] == true) {
//            cell.tag3.text = "Justiça Social"
//        } else if(comment.tags[5] == true) {
//            cell.tag3.text = "Transfobia"
//        } else {
//            cell.tag3.text = ""
//        }
//        
//        cell.commentText.text = comment.text
        
        cell.name.text = "random name"
        cell.rating.rating = 5
        if (true == true) {
            cell.tag1.text = "Diversidade"
        } else if(comment.tags[3] == true) {
            cell.tag1.text = "Racismo"
        } else {
            cell.tag1.text = ""
        }
        
        if (false == true) {
            cell.tag2.text = "Conscientizador"
        } else if(false == true) {
            cell.tag2.text = "Misoginia"
        } else {
            cell.tag2.text = ""
        }
        
        if (false == true) {
            cell.tag3.text = "Justiça Social"
        } else if(false == true) {
            cell.tag3.text = "Transfobia"
        } else {
            cell.tag3.text = ""
        }
        
        cell.commentText.text = "amazing text here"
        
        return cell
    }
    
    //MARK: Private methods
    private func loadSampleComments() {
        let comment1 = Comment(userName: "Luiza", rating: 1, text: "Ham corned beef chicken tri-tip leberkas beef ribs short ribs bresaola porchetta t-bone pork chop shoulder. Bresaola tail doner chicken ham short ribs. Landjaeger strip steak sausage, boudin ball tip chuck pork chop alcatra sha", tags: [false, false, false, true, false, false])
        let comment2 = Comment(userName: "Rafael", rating: 3, text: "Ham corned beef chicken tri-tip leberkas beef ribs short ribs bresaola porchetta t-bone pork chop shoulder. Bresaola tail doner chicken ham short ribs. Landjaeger strip steak sausage, boudin ball tip chuck pork chop alcatra sha", tags: [false, false, false, true, true, false])
        let comment3 = Comment(userName: "Gregorio", rating: 4, text: "Ham corned beef chicken tri-tip leberkas beef ribs short ribs bresaola porchetta t-bone pork chop shoulder. Bresaola tail doner chicken ham short ribs. Landjaeger strip steak sausage, boudin ball tip chuck pork chop alcatra sha", tags: [true, true, true, false, false, false])
        
        comments += [comment1!, comment2!, comment3!]
    }
    

}
