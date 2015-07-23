//
//  FeedVC.swift
//  AgendamentoCirurgia
//
//  Created by Alena Miklos on 15/07/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {

    @IBOutlet weak var tableFeed: UITableView!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    var requests = [Request]()
    
    //http://www.raywenderlich.com/76519/add-table-view-search-swift
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        self.requests = [Request(patientFullName: "sss", insurance: "sss", doctorName: "ssssss", doctorTelephone: 22355063, surgeryType: "blo", doctorApplication: "bloblo", patientBirth: 2010188, surgeryDate: 252427, gender: true)]
        

    }

//     func tableFeed(tableFeed: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.requests.count
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


}
