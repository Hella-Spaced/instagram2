//
//  ViewController.swift
//  instagram2
//
//  Created by Richard Rolle on 1/21/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import AFNetworking

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    
    @IBOutlet weak var pictureViev: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.rowHeight = 320;
        
        
        let clientId = "e05c462ebd86446ea48a5af73769b602"
        let url = NSURL(string:"https://api.instagram.com/v1/media/popular?client_id=\(clientId)")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                            NSLog("response: \(responseDictionary)")
                    }
                }
        });
        task.resume()
        
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

