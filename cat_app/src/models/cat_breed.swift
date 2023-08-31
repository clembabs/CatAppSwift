//
//  cat_breed.swift
//  cat_app
//
//  Created by Clement Babaniyi on 29/08/2023.
//

import Foundation


struct Breed: Codable, CustomStringConvertible, Identifiable {
    let id: String
    let name: String
    let temperament: String
    let breedExplanation: String
    let energyLevel: Int
    let isHairless: Bool
    let image: BreedImage?
    var description: String {
        return "breed with name: \(name) and id \(id)"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case breedExplanation = "description"
        case energyLevel = "energy_level"
        case isHairless = "hairless"
        case image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.temperament = try container.decode(String.self, forKey: .temperament)
        self.breedExplanation = try container.decode(String.self, forKey: .breedExplanation)
        energyLevel = try container.decode(Int.self, forKey: .energyLevel)
        let hairless = try container.decode(Int.self, forKey: .isHairless)
        isHairless = hairless == 1
        image = try container.decodeIfPresent(BreedImage.self, forKey: .image)
    }
    
    init(name: String, id: String, explaination: String, temperament: String,
         energyLevel: Int, isHairless: Bool, image: BreedImage?){
        self.name = name
        self.id = id
        self.breedExplanation = explaination
        self.energyLevel = energyLevel
        self.temperament = temperament
        self.image = image
        self.isHairless = isHairless
    }
    
    static func example1() -> Breed {
            return Breed(name: "Abyssinian",
                         id: "abys",
                         explaination: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
                         temperament: "Active, Energetic, Independent, Intelligent, Gentle",
                         energyLevel: 5,
                         isHairless: false, image: BreedImage(height: 100, id: "i", url: "https://cdn2.thecatapi.com/images/unX21IBVB.jpg", width: 100))
            
        }
        
        static func example2() -> Breed {
            return Breed(name: "Cyprus",
                         id: "cypr",
                         explaination: "Loving, loyal, social and inquisitive, the Cyprus cat forms strong ties with their families and love nothing more than to be involved in everything that goes on in their surroundings. They are not overly active by nature which makes them the perfect companion for people who would like to share their homes with a laid-back relaxed feline companion.",
                         temperament: "Affectionate, Social",
                         energyLevel: 4,
                         isHairless: false,
                         image: BreedImage(height: 100, id: "i", url: "https://cdn2.thecatapi.com/images/unX21IBVB.jpg", width: 100))
            
        }
}

