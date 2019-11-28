//
//  ChatViewController.swift
//  chatterApp
//
//  Created by Karan Sagar on 10/11/19.
//  Copyright © 2019 Karan. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
import ChameleonFramework

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    //Declare variable
    var messageArray:[Message] = [Message]() //Blank array of message object
    
    
    @IBOutlet weak var height: NSLayoutConstraint!
    @IBOutlet weak var sendMessageOutlet: UIButton!
    @IBOutlet weak var textFieldOutlet: UITextField!
    @IBOutlet weak var messageTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Set yourself as the delegate and datasource here:
        
        messageTableView.delegate = self
        messageTableView.dataSource = self
        textFieldOutlet.delegate = self

        //TODO: Set yourself as the delegate of the text field here:
        
        
        //TODO: Set the tapGesture here:
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)
        

        //TODO: Register your MessageCell.xib file here:
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell1")
        
        configureTableView()
        retriveMessasges()
        
        messageTableView.separatorStyle = .singleLine
    }
    
    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    
    //TODO: Declare cellForRowAtIndexPath here:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell1", for: indexPath) as! CustomeMessageCell
        
        cell.bodyMessage.text = messageArray[indexPath.row].messageBody
        cell.senderUserName.text = messageArray[indexPath.row].sender
        cell.avtarImage.image = UIImage(named: "egg")
        
        //Checking who is self or other user
        if cell.senderUserName.text == Auth.auth().currentUser?.email as String? {
            cell.avtarImage.backgroundColor = UIColor.flatTeal()
            cell.messageBackgroundView.backgroundColor = UIColor.flatGreenColorDark()
            cell.bodyMessage.textColor = UIColor.black
            cell.bodyMessage.textAlignment = .right
            cell.senderUserName.textAlignment = .right
            cell.senderUserName.textColor = UIColor.flatTeal()
        } else {
            cell.avtarImage.backgroundColor = UIColor.flatSkyBlue()
            cell.messageBackgroundView.backgroundColor = UIColor.flatWhite()
            cell.bodyMessage.textColor = UIColor.black
            cell.bodyMessage.textAlignment = .left

        }
        
        
        return cell
    }
    
    //TODO: Declare numberOfRowsInSection here:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    
    //TODO: Declare tableViewTapped here:
    
    @objc func tableViewTapped() {
        textFieldOutlet.endEditing(true)
    }
    
    
    
    //TODO: Declare configureTableView here:
    
    func configureTableView() {
        messageTableView.rowHeight = UITableView.automaticDimension
        messageTableView.estimatedRowHeight = 120.0
        
    }
    
    
    
    ///////////////////////////////////////////
    
    //MARK:- TextField Delegate Methods
    
    
    //TODO: Declare textFieldDidBeginEditing here:
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        //Animate the keybord pop
        UIView.animate(withDuration: 0.5) {
            self.height.constant = 370
            self.view.layoutIfNeeded()
        }
    }
    
    
    
    
    
    //TODO: Declare textFieldDidEndEditing here:
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.height.constant = 50
            self.view.layoutIfNeeded()
        }
    }
    
    
    
    ///////////////////////////////////////////
    
    
    //MARK: - Send & Recieve from Firebase
    
    
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        
        //signout firebase
        do {
            try Auth.auth().signOut()
            
            //navigate back to rootview controller
            navigationController?.popViewController(animated: true)
        } catch {
            print("Error, there was a problem signing out.")
        }
    }
    
    //TODO: Create the retrieveMessages method here:
    //Getting messages
    
    func retriveMessasges() {
        let messageDB = Database.database().reference().child("Messagess")
        messageDB.observe(.childAdded, with: { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String, String>
            
            let text = snapshotValue["MessageBody"]!
            let sender = snapshotValue["Sender"]!
            
            let message = Message()
            message.messageBody = text
            message.sender = sender
            
            self.messageArray.append(message)
            
            self.configureTableView()
            self.messageTableView.reloadData()
            
        })
    }
    
    
    @IBAction func sendMessageButtonPressed(_ sender: Any) {
        
        SVProgressHUD.show()
                
        textFieldOutlet.endEditing(true)
        
        textFieldOutlet.isEnabled = false
        sendMessageOutlet.isEnabled = false
        
        //Create messages databse inside firebase database
        
        let messageDB = Database.database().reference().child("Messagess")
        
        //save user's message as disctionary
        let messageDictionary = ["Sender": Auth.auth().currentUser?.email,
                                 "MessageBody": textFieldOutlet.text] //collection type
        
        //use firebase method - chid
        
        messageDB.childByAutoId().setValue(messageDictionary) {
            (error, reference) in
            if error != nil {
                print(error!)
                
                SVProgressHUD.dismiss()
                
            } else {
                print("messages saved sucessfully!")
                
                SVProgressHUD.dismiss()
                
                // re-enable the button and textfield.
                self.textFieldOutlet.isEnabled = true
                self.sendMessageOutlet.isEnabled = true
                
                //re-set message text field
                self.textFieldOutlet.text = ""
            }
        }
        // It create a custom random key ; which can save under their own unique identifier
        
        
        
    }
    
    
}
