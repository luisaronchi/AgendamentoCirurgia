//
//  FeedVC.swift
//  AgendamentoCirurgia
//
//  Created by Alena Miklos on 15/07/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBAction func NewRequest(sender: UIButton) {
        
        var requestVC = RequestVC(nibName: "RequestVC", bundle: nil)
        self.presentViewController(requestVC, animated: true, completion:nil)
    }
    
    
    
    @IBOutlet weak var tableFeed: UITableView!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requestList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Request que eu devo usar para preencher a célula
        let request = requestList[indexPath.row]
        
        let cellIdentifier = "requestCell"
        
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        }

        // TODO: Preencher informações
        
        cell.textLabel?.text = request.doctorName
        
        return cell
    }
}


// Gambiarra temporária
var requestList: [Request] = [Request]()

// (var ou let) variableName: VariableType

// (var ou let) variableName(: VariableType) = VariableType()
// Ex.:
// let a: Int = 2   -> Jeito tradicional    (ERRADO)
// let a = 2        -> Jeito Swift          (CERTO) BY RENEN

// Array<Request> == [Request]
// Array<Request>   -> Jeito tradicional    (ERRADO)
// [Request]        -> Jeito Swift          (CERTO) BY RENEN
