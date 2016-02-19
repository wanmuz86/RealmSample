//
//  ToDoItem.swift
//  RealmSampleSwift
//
//  Created by ME-Tech MacPro User 2 on 2/19/16.
//  Copyright © 2016 iTrain Asia. All rights reserved.
//

import Realm

class ToDoItem: RLMObject {
    dynamic var name = ""
    dynamic var itemDescription = ""
    dynamic var finished = false
}
