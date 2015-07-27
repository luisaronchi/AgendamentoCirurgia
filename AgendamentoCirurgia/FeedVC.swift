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
        
        var controller: RequestVC = RequestVC(nibName:"RequestVC", bundle:nil)
        self.presentViewController(controller, animated: true, completion: nil)
        
        //let vc = RequestVC(nibName: "RequestVC", bundle: nil)
        //self.navigationController?.pushViewController(vc, animated: true)
        
        //muda o texto do botão do navigation
        let backItem = UIBarButtonItem(title: " Cancelar", style: .Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
    }
    
    
    
    @IBOutlet weak var tableFeed: UITableView!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //navigation
        self.navigationItem.title = "Agendamentos"
        
        self.navigationItem.setRightBarButtonItem(UIBarButtonItem(title: "+", style: .Plain, target: self, action: "NewRequest:"), animated: true)

    }
    
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
