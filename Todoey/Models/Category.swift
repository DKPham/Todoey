//
//  Category.swift
//  Todoey
//
//  Created by Duy Pham on 9/26/18.
//  Copyright © 2018 Duy Khac. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
