//
//  ChatViewController.swift
//  chatterApp
//
//  Created by Karan Sagar on 10/11/19.
//  Copyright © 2019 Karan. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sendMessageOutlet: UIButton!
    @IBOutlet weak var textFieldOutlet: UITextField!
    @IBOutlet weak var messageTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //TODO: Set yourself as the delegate and datasource here:
        
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        
        
        
        
        //TODO: Set yourself as the delegate of the text field here:

        
        
        //TODO: Set the tapGesture here:
        
        

        //TODO: Register your MessageCell.xib file here:
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell1")
        
        configureTableView()
    }
    
    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    
    //TODO: Declare cellForRowAtIndexPath here:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell1", for: indexPath) as! CustomeMessageCell
        
        let messageArray = ["First Message", "Second Message, hey how are you today Second Message, hey how are you today Second Message, hey how are you today Second Message, hey how are you today Second Message, hey how are you today Second Message, hey how are you today Second Message, hey how are you today Second Message, hey how are you today Second Message, hey how are you today Second Message, hey how are you today Second Message, hey how are you today Second Message, hey how are you today Second Message, hey how are you today Second Message, hey how are you today Second Message, hey how are you today Second Message, hey how are you today Second Message, hey how are you today Second Message, hey how are you today Second Message, hey how are you today Second Message, hey how are you today ", "Thrid Message"]
        cell.bodyMessage.text = messageArray[indexPath.row]
        return cell
        
    }
    
    
    //TODO: Declare numberOfRowsInSection here:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    //TODO: Declare tableViewTapped here:
    
    
    
    //TODO: Declare configureTableView here:
    
    func configureTableView() {
        messageTableView.rowHeight = UITableView.automaticDimension
        messageTableView.estimatedRowHeight = 120.0
    }
    
    
    
    ///////////////////////////////////////////
    
    //MARK:- TextField Delegate Methods
    
    

    
    //TODO: Declare textFieldDidBeginEditing here:
    
    
    
    
    //TODO: Declare textFieldDidEndEditing here:
    

    
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

    
    @IBAction func sendMessageButtonPressed(_ sender: Any) {
        
    }
    

}
