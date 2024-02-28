//
//  Crypto.swift
//  CryptoCrazyRxMVVM
//
//  Created by Ferhat Ayar on 16.02.2024.
//

import Foundation

//Codable = Hem decodable hem de encodable edilebilir
//Decodable = Sunucudan veri alıp kullanma
//Encodable = Sunucuya geri veri yollama

struct Crypto : Decodable {
    let currency : String
    let price : String
}
