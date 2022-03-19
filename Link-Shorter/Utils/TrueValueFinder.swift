//
//  TrueValueFinder.swift
//  Link-Shorter
//
//  Created by Tahir Uzelli on 19.03.2022.
//

import Foundation

func trueValueFinder(myArray : [Bool])->Int{
    for index in 0...(myArray.count-1) {
        if(myArray[index] == true){
            return index
        }
        
    }
    return -1
}
