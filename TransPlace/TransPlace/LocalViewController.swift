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


    @IBOutlet weak var rating: RatingControl!
    @IBOutlet weak var tableView: UITableView!
    var comments = [Comment]()
   
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var positiveBtn: UIBarButtonItem!
    
    @IBOutlet weak var negativeBtn: UIBarButtonItem!
    
    let cellSpacingHeight: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNegativeComments()
        
        tableView!.delegate = self
        tableView!.dataSource = self
        self.view .addSubview(tableView!)
        
        // navbar tittle
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor(red: 106.0/255, green: 43.0/255, blue: 252.0/255, alpha: 1.0)]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict as! [String : Any]
        
        // buttons
        positiveBtn.tintColor = UIColor(red: 106.0/255, green: 43.0/255, blue: 252.0/255, alpha: 1.0)
        negativeBtn.tintColor = UIColor(red: 106.0/255, green: 43.0/255, blue: 252.0/255, alpha: 1.0)
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
    
    //MARK: TableViewConfigs
    
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
        cell.rating.rating = comment.rating
        if (comment.tags[0] == true) {
            cell.tag1.text = "Diversidade"
        } else if(comment.tags[3] == true) {
            cell.tag1.text = "Racismo"
        } else {
            cell.tag1.text = ""
        }
        
        if (comment.tags[1] == true) {
            cell.tag2.text = "Conscientizador"
        } else if(comment.tags[4] == true) {
            cell.tag2.text = "Misoginia"
        } else {
            cell.tag2.text = ""
        }
        
        if (comment.tags[2] == true) {
            cell.tag3.text = "Justiça Social"
        } else if(comment.tags[5] == true) {
            cell.tag3.text = "Transfobia"
        } else {
            cell.tag3.text = ""
        }
        
        cell.commentText.text = comment.text
        
        // cell design
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        return cell
    }
    
    
    
    
    //MARK: Actions
    @IBAction func positiveComments(_ sender: Any) {
        setPositiveComments()
    }
    @IBAction func negativeComments(_ sender: Any) {
        setNegativeComments()
    }
    

    
    //MARK: Private methods
    private func setNegativeComments() {
        let comment1 = Comment(userName: "Luiza", rating: 1, text: "Ham corned beef chicken tri-tip leberkas beef ribs short ribs bresaola porchetta t-bone pork chop shoulder. Bresaola tail doner chicken ham short ribs. Landjaeger strip steak sausage, boudin ball tip chuck pork chop alcatra sha", tags: [false, false, false, true, false, false])
        let comment2 = Comment(userName: "Rafael", rating: 3, text: "Ham corned beef chicken tri-tip leberkas beef ribs short ribs bresaola porchetta t-bone pork chop shoulder. Bresaola tail doner chicken ham short ribs. Landjaeger strip steak sausage, boudin ball tip chuck pork chop alcatra sha", tags: [false, false, false, true, true, false])
        let comment3 = Comment(userName: "Gregorio", rating: 2, text: "Ham corned beef chicken tri-tip leberkas beef ribs short ribs bresaola porchetta t-bone pork chop shoulder. Bresaola tail doner chicken ham short ribs. Landjaeger strip steak sausage, boudin ball tip chuck pork chop alcatra sha", tags: [false, false, false, true, true, true])
        comments.removeAll()
        comments += [comment1!, comment2!, comment3!]
        self.tableView.reloadData()
    }
    
    private func setPositiveComments() {
        let comment1 = Comment(userName: "Ricardo", rating: 5, text: "Ham corned beef chicken tri-tip leberkas beef ribs short ribs bresaola porchetta t-bone pork chop shoulder. Bresaola tail doner chicken ham short ribs. Landjaeger strip steak sausage, boudin ball tip chuck pork chop alcatra sha", tags: [true, false, true, false, false, false])
        let comment2 = Comment(userName: "Roberta", rating: 4, text: "Ham corned beef chicken tri-tip leberkas beef ribs short ribs bresaola porchetta t-bone pork chop shoulder. Bresaola tail doner chicken ham short ribs. Landjaeger strip steak sausage, boudin ball tip chuck pork chop alcatra sha", tags: [false, true, false, false, false, false])
        let comment3 = Comment(userName: "Anastor", rating: 4, text: "Ham corned beef chicken tri-tip leberkas beef ribs short ribs bresaola porchetta t-bone pork chop shoulder. Bresaola tail doner chicken ham short ribs. Landjaeger strip steak sausage, boudin ball tip chuck pork chop alcatra sha", tags: [true, true, true, false, false, false])
        comments.removeAll()
        comments += [comment1!, comment2!, comment3!]
        self.tableView.reloadData()
    }

}
