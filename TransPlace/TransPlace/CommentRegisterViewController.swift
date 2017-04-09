//
//  CommentRegisterViewController.swift
//  TransPlace
//
//  Created by Junior Lima on 08/04/17.
//  Copyright © 2017 Junior Lima. All rights reserved.
//

import UIKit

class CommentRegisterViewController: UITableViewController , UITextViewDelegate, UITextFieldDelegate{


    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tagSegmentedControl: UISegmentedControl!
 
    @IBOutlet weak var anonymousSwitch: UISwitch!
    
    @IBOutlet weak var dateTextField: UITextField!
    let badTagsArray = ["transfobia", "misoginia", "assedio"]
    let goodTagsArray = ["apoiaDiversidade", "conscientizador", "justiçaSocial"]
    
    var choosedTags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "back-2"), for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        btn.addTarget(self, action: #selector(backScreen), for: .touchUpInside)
        let item = UIBarButtonItem(customView: btn)
        
        let btn2 = UIButton(type: .custom)
        btn2.setImage(UIImage(named: "plus"), for: .normal)
        btn2.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        btn2.addTarget(self, action: #selector(saveScreen), for: .touchUpInside)
        let item2 = UIBarButtonItem(customView: btn2)
        
        navigationItem.setLeftBarButtonItems([item], animated: true)
        navigationItem.setRightBarButtonItems([item2], animated: true)
        
        descriptionTextView.text = "Adicione aqui uma descrição..."
        descriptionTextView.textColor = UIColor.lightGray
        descriptionTextView.delegate = self
        // Do any additional setup after loading the view.
   
        addTagSubViews()
        
        anonymousSwitch.onTintColor = #colorLiteral(red: 0.4970856905, green: 0.3023125529, blue: 0.9918896556, alpha: 1)
        dateTextField.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        //textView.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Adicione aqui uma descrição..."
            textView.textColor = UIColor.lightGray
        }
    }
    
    func dismissKeyboard(_ sender : UITapGestureRecognizer) {
        
        let point = sender.location(in: self.view)
        if !descriptionTextView.frame.contains(point) {
            descriptionTextView.resignFirstResponder()
        }
        dateTextField.resignFirstResponder()
        
    }
    
    func tagTapped(_ sender : UIButton){
        
        if sender.backgroundColor == #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) {
            sender.backgroundColor = #colorLiteral(red: 0.4970856905, green: 0.3023125529, blue: 0.9918896556, alpha: 1)
            choosedTags.append((sender.titleLabel?.text!)!)
        } else {
            sender.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            for i in 0..<choosedTags.count {
                if choosedTags[i] == (sender.titleLabel?.text!)! {
                    choosedTags.remove(at: i)
                    break;
                }
            }
        }
        
    }
    
    func backScreen(){
        navigationController?.popViewController(animated: true)
    }
    
    func saveScreen(){
        navigationController?.popViewController(animated: true)
    }
    
    func addTagSubViews(){
        for view in scrollView.subviews {
            view.removeFromSuperview()
        }
        
        choosedTags = []
        var lastSize : CGFloat = 0.0
        if tagSegmentedControl.selectedSegmentIndex == 0 {
            for i in 0..<badTagsArray.count {
                let tag = UIButton(frame: CGRect(x: lastSize + 10.0, y: 0.0, width: 100.0, height:  scrollView.frame.height - 20.0))
                
                tag.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                tag.layer.cornerRadius = 7.0
                tag.setTitle(badTagsArray[i], for: .normal)
                tag.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
                tag.titleLabel?.textAlignment = .center
                tag.titleLabel?.font = UIFont(name: "System", size: 17)
                tag.sizeToFit()
                tag.frame = CGRect(x: tag.frame.minX, y: tag.frame.minY, width: tag.frame.width + 20, height: tag.frame.height)
                tag.center.y = scrollView.frame.height/2
                tag.addTarget(self, action: #selector(tagTapped(_:)), for: .touchUpInside)
                lastSize += (10.0 + tag.frame.width)
                scrollView.addSubview(tag)
            }
        } else {
            for i in 0..<badTagsArray.count {
                let tag = UIButton(frame: CGRect(x: lastSize + 10.0,
                                                 y: 0.0,
                                                 width: 100.0,
                                                 height: scrollView.frame.height - 20.0))
                
                tag.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                tag.layer.cornerRadius = 7.0
                tag.setTitle(goodTagsArray[i], for: .normal)
                tag.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
                tag.titleLabel?.textAlignment = .center
                tag.titleLabel?.font = UIFont(name: "System", size: 17)
                tag.sizeToFit()
                tag.frame = CGRect(x: tag.frame.minX, y: tag.frame.minY, width: tag.frame.width + 20, height: tag.frame.height)
                tag.addTarget(self, action: #selector(tagTapped(_:)), for: .touchUpInside)
                lastSize += (10.0 + tag.frame.width)
                tag.center.y = scrollView.frame.height/2
                scrollView.addSubview(tag)
            }
        }
        
    }
    @IBAction func segmentedChanged(_ sender: Any) {
        addTagSubViews()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let inputView = UIView(frame: CGRect(x:0,y: 0,width: self.view.frame.width,height: 240))
        
        
        var datePickerView  : UIDatePicker = UIDatePicker(frame: CGRect(x: 0, y: 40, width: 0, height: 0))
        datePickerView.datePickerMode = UIDatePickerMode.date
        inputView.addSubview(datePickerView) // add date picker to UIView
        datePickerView.center.x = inputView.center.x
        let doneButton = UIButton(frame: CGRect(x:(self.view.frame.size.width/2) - (100/2),y: 0,width: 100, height:50))
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitle("Done", for: .highlighted)
        doneButton.setTitleColor(UIColor.black, for: .normal)
        doneButton.setTitleColor(UIColor.gray, for: .highlighted)
        
        inputView.addSubview(doneButton) // add Button to UIView
        
        doneButton.addTarget(self, action: #selector(doneButton(_:)), for: .touchUpInside) // set button click event
        
        textField.inputView = inputView
        datePickerView.addTarget(self, action: #selector(handleDatePicker), for: .valueChanged)
        
        handleDatePicker(datePickerView)
    }
    
    
    func handleDatePicker(_ sender: UIDatePicker) {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateTextField.text = dateFormatter.string(from: sender.date)
        dateTextField.sizeToFit()
        dateTextField.center.x = view.frame.width - (10 + dateTextField.frame.width/2)
    }
    
    func doneButton(_ sender:UIButton)
    {
        dateTextField.resignFirstResponder() // To resign the inputView on clicking done.
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
