//
//  DataModel.swift
//  RSSFromScratch
//
//  Created by Developer on 26/02/17.
//  Copyright © 2017 vlad. All rights reserved.
//

import Foundation

class DataModel{
    var title: String?
    var description: String?
    var date: String?
    var imageURL: String?
    var articleURL: String?
    
   init(titleArg: String, descriptionArg: String, dateArg: String, imageURLArg: String, articleURLArg: String) {
        self.title = titleArg
        self.description = descriptionArg
        self.date = dateArg
        self.imageURL = imageURLArg
        self.articleURL = articleURLArg
    }
    
}
