//
//  DataManagement.swift
//  MTGTracker
//
//  Created by Pirita on 01/09/2022.
//

import Foundation
import Combine
import SwiftUI


struct Dog: Codable {
    var name: String
    var owner: String
}

func save(modelDataToSave: ModelData){
    /*
    
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    
    let data = try encoder.encode(modelDataToSave)
    print(String(data: data, encoding: .utf8)!)
    
    
    
    // Encode
    let jsonEncoder = JSONEncoder()
    
    do{
        let jsonData = try jsonEncoder.encode(dataToSave)
        let json = String(data: jsonData, encoding: String.Encoding.utf8)
    }
    catch{
        print("couldn't encode")
    }
*/

}

func load(jsonData: Data){
    /*
   
    // Decode
    let jsonDecoder = JSONDecoder()
    do{
        let loadedModelData = try jsonDecoder.decode(ModelData.self, from: jsonData)
    }
    catch {
        
    }
     
     */
}

/*
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


func save(){

}
 */
