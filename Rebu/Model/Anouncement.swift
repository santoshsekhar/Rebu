//
//  Anouncement.swift
//  Rebu
//
//  Created by SANTOSH SEKHAR M B on 11/26/18.
//  Copyright © 2018 Jennaikode,Vamshi Raj. All rights reserved.
//

import Foundation

@objcMembers

class TakeRideAnouncement: NSObject {
    
    var name:String
    var startPoint:String
    var endPoint:String
    var contact:String
    var extraInfo:String
    
    override var description: String
    {
        return " name:\(name), startpoint:\(startPoint), endpoint:\(endPoint), contact:\(contact), extraInfo\(extraInfo)"
    }
    
    init(name:String, startPoint:String, endPoint:String, contact:String, extra:String) {
        self.name = name
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.contact = contact
        self.extraInfo = extra
    }
    
    convenience override init()
    {
        self.init(name:"SS", startPoint:"Maryville", endPoint:"Kansas City", contact:"123456789", extra:"Lets meet at a common point")
    }
    
    
    
}

@objcMembers

class GiveRideAnouncement: NSObject {

    var name:String
    var startPoint:String
    var endPoint:String
    var contact:String
    var extraInfo:String

    override var description: String
    {
        return " name:\(name), startpoint:\(startPoint), endpoint:\(endPoint), contact:\(contact), extraInfo\(extraInfo)"
    }

    init(name:String, startPoint:String, endPoint:String, contact:String, extra:String) {
        self.name = name
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.contact = contact
        self.extraInfo = extra
    }

    convenience override init()
    {
        self.init(name:"SS", startPoint:"Maryville", endPoint:"Kansas City", contact:"123456789", extra:"Lets meet at a common point")
    }



}


@objcMembers
class Anouncements {
    
    
    let backendless = Backendless.sharedInstance()
    var giveRideItemDataStore:IDataStore!
    var takeRideItemDataStore:IDataStore!
    
    static var anounce:Anouncements = Anouncements()
    
    var anouncementTakeRide:[TakeRideAnouncement] = []
    var anouncementGiveRide:[GiveRideAnouncement] = []
    
    init()
    {
        takeRideItemDataStore = backendless?.data.of(TakeRideAnouncement.self)
        giveRideItemDataStore = backendless?.data.of(GiveRideAnouncement.self)
    }
    
    var rideSelect:String = ""
    
    // saves the anouncement posted for requesting a ride
    func saveTakeRideAnouncements(name:String, startPoint:String, endPoint:String, contact:String, extra:String )
    {
        var itemToSave = TakeRideAnouncement(name: name, startPoint: startPoint, endPoint: endPoint, contact: contact, extra: extra)
        
        takeRideItemDataStore.save(itemToSave,response:{(result) -> Void in
            itemToSave = result as! TakeRideAnouncement
            self.anouncementTakeRide.append(itemToSave)
            self.retrieveAllTakeRides() },
                           
                           error:{(exception) -> Void in
                            print(exception.debugDescription)
            
        })
    }
    // saves the anouncement posted for offering a ride
    func saveGiveRideAnouncements(name:String, startPoint:String, endPoint:String, contact:String, extra:String )
    {
        var itemToSave = GiveRideAnouncement(name: name, startPoint: startPoint, endPoint: endPoint, contact: contact, extra: extra)
        
        giveRideItemDataStore.save(itemToSave,response:{(result) -> Void in
            itemToSave = result as! GiveRideAnouncement
            self.anouncementGiveRide.append(itemToSave)
            self.retrieveAllGiveRides() },
                           
                           error:{(exception) -> Void in
                            print(exception.debugDescription)
                            
        })
    }

    // retrieves the anouncement posted for taking a ride
    func retrieveAllTakeRides()
    {
        let queryBuilder = DataQueryBuilder()
        queryBuilder!.setPageSize(100)
        
        takeRideItemDataStore.find(queryBuilder, response: {(results) -> Void in
            self.anouncementTakeRide = results as! [TakeRideAnouncement]
        },
                           error:{(exception) -> Void in
                            print(exception.debugDescription)
        })
    }
    
    // retrieves the anouncement posted for taking a ride
    func retrieveAllGiveRides()
    {
        let queryBuilder = DataQueryBuilder()
        queryBuilder!.setPageSize(100)
        
        giveRideItemDataStore.find(queryBuilder, response: {(results) -> Void in
            self.anouncementGiveRide = results as! [GiveRideAnouncement]
        },
                           error:{(exception) -> Void in
                            print(exception.debugDescription)
        })
    }
    
    
    
    
    
    
    


}
