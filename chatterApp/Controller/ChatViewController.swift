//
//  ChatViewController.swift
//  chatterApp
//
//  Created by Karan Sagar on 10/11/19.
//  Copyright © 2019 Karan. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet weak var sendMessageOutlet: UIButton!
    @IBOutlet weak var textFieldOutlet: UITextField!
    @IBOutlet weak var messageTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //TODO: Set yourself as the delegate and datasource here:
        
        
        
        //TODO: Set yourself as the delegate of the text field here:

        
        
        //TODO: Set the tapGesture here:
        
        

        //TODO: Register your MessageCell.xib file here:

    }
    
    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    
    
    //TODO: Declare cellForRowAtIndexPath here:
    
    
    
    //TODO: Declare numberOfRowsInSection here:
    
    
    
    //TODO: Declare tableViewTapped here:
    
    
    
    //TODO: Declare configureTableView here:
    
    
    
    ///////////////////////////////////////////
    
    //MARK:- TextField Delegate Methods
    
    

    
    //TODO: Declare textFieldDidBeginEditing here:
    
    
    
    
    //TODO: Declare textFieldDidEndEditing here:
    

    
    ///////////////////////////////////////////
    
    
    //MARK: - Send & Recieve from Firebase
    
    
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
    }
    
    //TODO: Create the retrieveMessages method here:

    
    @IBAction func sendMessageButtonPressed(_ sender: Any) {
    }
    

}
