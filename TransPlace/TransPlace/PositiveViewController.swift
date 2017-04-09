//
//  PositiveViewController.swift
//  TransPlace
//
//  Created by Junior Lima on 09/04/17.
//  Copyright © 2017 Junior Lima. All rights reserved.
//

import UIKit

class PositiveViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var commentTableView: UITableView!
    var comments = [Comment]()
    let cellSpacingHeight: CGFloat = 5
    
    var tags = ["misoginia", "racismo"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentTableView.delegate = self
        commentTableView.dataSource = self
        
        setPositiveComments()
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    // Set the spacing between sections
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CommentViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CommentViewCell  else {
            fatalError("The dequeued cell is not an instance of CommentViewCell.")
        }
        
        let comment = comments[indexPath.section]
        
        cell.name.text = comment.userName
        
        
        cell.stars.value =  CGFloat(comment.rating)
        
        cell.stars.isEnabled = false
       
        var lastSize = 0.0
        for tagtext in tags {
            let tag = UIButton(frame: CGRect(x: lastSize + 10.0, y: 0.0, width: 100.0, height:  Double(cell.scrollView.frame.height - 20.0)))
            
            tag.backgroundColor = #colorLiteral(red: 0.4970856905, green: 0.3023125529, blue: 0.9918896556, alpha: 1)
            tag.layer.cornerRadius = 7.0
            tag.setTitle(tagtext, for: .normal)
            tag.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            tag.titleLabel?.textAlignment = .center
            tag.titleLabel?.font = UIFont(name: "System", size: 17)
            tag.sizeToFit()
            tag.frame = CGRect(x: tag.frame.minX, y: tag.frame.minY, width: tag.frame.width + 20, height: tag.frame.height)
            tag.center.y = cell.scrollView.frame.height/2
            tag.addTarget(self, action: #selector(tagTapped(_:)), for: .touchUpInside)
            lastSize += Double(10.0 + tag.frame.width)
            cell.scrollView.addSubview(tag)
        }
        cell.commentDate.text = comment.commentDate
        
        cell.commentText.text = comment.text
        
        
        // cell design
        cell.backgroundColor = UIColor.white
        cell.clipsToBounds = true
        
        return cell
    }
    
    func setPositiveComments() {
        let comment1 = Comment(userName: "Ricardo", rating: 5, text: "Ham corned beef chicken tri-tip leberkas beef ribs short ribs bresaola porchetta t-bone pork chop shoulder. Bresaola tail doner chicken ham short ribs. Landjaeger strip steak sausage, boudin ball tip chuck pork chop alcatra sha", commentDate: "05/01/2017", tags: [true, false, true, false, false, false])
        let comment2 = Comment(userName: "Roberta", rating: 4, text: "Ham corned beef chicken tri-tip leberkas beef ribs short ribs bresaola porchetta t-bone pork chop shoulder. Bresaola tail doner chicken ham short ribs. Landjaeger strip steak sausage, boudin ball tip chuck pork chop alcatra sha", commentDate: "07/02/2017", tags: [false, true, false, false, false, false])
        let comment3 = Comment(userName: "Anastor", rating: 4, text: "Ham corned beef chicken tri-tip leberkas beef ribs short ribs bresaola porchetta t-bone pork chop shoulder. Bresaola tail doner chicken ham short ribs. Landjaeger strip steak sausage, boudin ball tip chuck pork chop alcatra sha", commentDate: "02/03/2017",tags: [true, true, true, false, false, false])
        comments.removeAll()
        comments += [comment1!, comment2!, comment3!]
        self.commentTableView.reloadData()
    }
    
    func tagTapped(_ sender: UIButton){
        let parent = self.parent as! LocalViewController
        
        parent.makeSegue((sender.titleLabel?.text!)!)
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
