//
//  Webservice.swift
//  CryptoCrazyRxMVVM
//
//  Created by Ferhat Ayar on 16.02.2024.
//

import Foundation

enum CryptoError : Error {
    case serverError
    case parsingError
}

class Webservice{
    
    //escaping = bu işlem bittikten sonra ne yapıcağını belirtmek için kullanılır
    //result<Ne döndürceksek o> = Başarılıysa başarıyı veiyor hata varsa vatayı verir
    //[] => [Crypto]  çok fazla veri gelceği için listeye alıyoruz
    
    func downloadCurrencies(url:URL, completion : @escaping(Result<[Crypto],CryptoError>) -> () ){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.serverError))
            }else if let data = data {
                let cryptoList = try? JSONDecoder().decode([Crypto].self, from: data)
                if let cryptoList = cryptoList {
                    completion(.success(cryptoList))
                }else {
                    completion(.failure(.parsingError))
                }
            }
        }
        .resume()
    }
    
}
