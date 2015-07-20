//
//  FeedVC.swift
//  AgendamentoCirurgia
//
//  Created by Alena Miklos on 15/07/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {

    @IBAction func NewRequest(sender: UIButton) {
        
        var controller: RequestVC = RequestVC(nibName:"RequestVC", bundle:NSBundle.mainBundle())
        self.presentViewController(controller, animated: true, completion: nil)
    }
    @IBOutlet weak var tableFeed: UITableView!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
