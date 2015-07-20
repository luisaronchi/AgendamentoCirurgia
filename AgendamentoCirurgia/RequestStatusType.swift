//
//  RequestStatusType.swift
//  AgendamentoCirurgia
//
//  Created by Carol Grädel on 7/13/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

enum RequestStatusType {
    
    case Sent(Int)
    case HospitalOK(Int)
    case InsuranceOK(Int)
    case Denied(Int)
    case Finalized(Int)
}
    



