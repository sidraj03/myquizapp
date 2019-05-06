//
//  question.swift
//  Quizzler
//
//  Created by Sidharth  Miglani on 27/7/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation
class Question{
    let quesText:String
    let val:Bool
    init(text:String,correctAnswer:Bool)
    {
        quesText=text
        val=correctAnswer
        
    }
}

