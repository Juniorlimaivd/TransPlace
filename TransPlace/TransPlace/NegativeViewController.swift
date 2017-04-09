//
//  NegativeViewController.swift
//  TransPlace
//
//  Created by Junior Lima on 09/04/17.
//  Copyright © 2017 Junior Lima. All rights reserved.
//

import UIKit

class NegativeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var commentTableView: UITableView!
    var comments = [Comment]()
    let cellSpacingHeight: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentTableView.delegate = self
        commentTableView.dataSource = self
        
        setNegativeComments()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView:UITableView, heightForRowAt indexPath:IndexPath)->CGFloat {
        return 150
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CommentViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CommentViewCell  else {
            fatalError("The dequeued cell is not an instance of CommentViewCell.")
        }
        
        let comment = comments[indexPath.section]
        
        cell.name.text = comment.userName
        cell.stars.value = CGFloat(comment.rating)

        cell.commentDate.text = comment.commentDate
        
        cell.commentText.text = comment.text
        
        
        // cell design
        cell.backgroundColor = UIColor.white
        cell.clipsToBounds = true
        
        return cell
    }
    
    func setNegativeComments() {
        let comment1 = Comment(userName: "Luiza", rating: 1, text: "Ham corned beef chicken tri-tip leberkas beef ribs short ribs bresaola porchetta t-bone pork chop shoulder. Bresaola tail doner chicken ham short ribs. Landjaeger strip steak sausage, boudin ball tip chuck pork chop alcatra sha", commentDate: "05/11/2016", tags: [false, false, false, true, false, false])
        let comment2 = Comment(userName: "Rafael", rating: 3, text: "Ham corned beef chicken tri-tip leberkas beef ribs short ribs bresaola porchetta t-bone pork chop shoulder. Bresaola tail doner chicken ham short ribs. Landjaeger strip steak sausage, boudin ball tip chuck pork chop alcatra sha", commentDate: "15/09/2016", tags: [false, false, false, true, true, false])
        let comment3 = Comment(userName: "Gregorio", rating: 2, text: "Ham corned beef chicken tri-tip leberkas beef ribs short ribs bresaola porchetta t-bone pork chop shoulder. Bresaola tail doner chicken ham short ribs. Landjaeger strip steak sausage, boudin ball tip chuck pork chop alcatra sha", commentDate: "12/12/2016", tags: [false, false, false, true, true, true])
        comments.removeAll()
        comments += [comment1!, comment2!, comment3!]
        commentTableView.reloadData()
    }

}
