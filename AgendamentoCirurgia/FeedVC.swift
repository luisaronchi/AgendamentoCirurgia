//
//  FeedVC.swift
//  AgendamentoCirurgia
//
//  Created by Alena Miklos on 15/07/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBAction func NewRequest(sender: UIButton) {
        
        var requestVC = RequestVC(nibName: "RequestVC", bundle: nil)
        self.presentViewController(requestVC, animated: true, completion:nil)
        
        //let vc = RequestVC(nibName: "RequestVC", bundle: nil)
        //self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @IBOutlet weak var tableFeed: UITableView!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationItem.title = "Lista de Agendamentos"
        self.navigationItem.setRightBarButtonItem(UIBarButtonItem(title: "+",style: .Plain, target: self, action: "NewRequest:"), animated: true)
        
        //logout provisório
        //let backItem = UIBarButtonItem(title: "Logout", style: .Plain, target: nil, action: nil)
        //navigationItem.backBarButtonItem = backItem
        
        //self.navigationItem.hidesBackButton = true;

    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (tableView == searchDisplayController?.searchResultsTableView) ?  filteredRequestList.count : requestList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let request = (tableView == searchDisplayController?.searchResultsTableView) ?  filteredRequestList[indexPath.row] : requestList[indexPath.row]
        
        // Request que eu devo usar para preencher a célula
//        let request = requestList[indexPath.row]
        
        let cellIdentifier = "requestCell"
        
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        }

        // TODO: Preencher informações
        
        // Isso é o certo
        // cell.textLabel?.text = request.doctorName
        
        cell.textLabel?.text = request
        cell.textLabel?.font = UIFont (name: "MyriadPro-Regular", size: 16)
        return cell
    }


    func searchBar (searchBar: UISearchBar, textDidChange searchText: String)
    {
        println("Entrei aqui")
        filteredRequestList = requestList.filter { (name: String) -> Bool in
            let stringMatch = name.capitalizedString.rangeOfString(searchText.capitalizedString)
            return stringMatch != nil
        }
    }
}


// Gambiarra temporária
//var requestList: [Request] = [Request]()

var filteredRequestList = [String]()

var requestList = ["Alena Miklos", "Carol Gradel", "Jenifer Emmanuel", "Luisa Ronchi", "Verônica Montezuma", "Renan Almeida", "Gustavo Severo", "Fabio Gois"]

// (var ou let) variableName: VariableType

// (var ou let) variableName(: VariableType) = VariableType()
// Ex.:
// let a: Int = 2   -> Jeito tradicional    (ERRADO)
// let a = 2        -> Jeito Swift          (CERTO) BY RENEN

// Array<Request> == [Request]
// Array<Request>   -> Jeito tradicional    (ERRADO)
// [Request]        -> Jeito Swift          (CERTO) BY RENEN
