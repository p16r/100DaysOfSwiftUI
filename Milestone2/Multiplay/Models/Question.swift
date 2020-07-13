//
//  Question.swift
//  Multiplay
//
//  Created by Prathamesh Kowarkar on 12/07/20.
//

struct Question {

    let multiplicand: Int
    let multiplier: Int

    var statement: String { "What is \(multiplicand) × \(multiplier)?" }

    var answer: Int { multiplicand * multiplier }

}
