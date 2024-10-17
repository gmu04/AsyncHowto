// Post.swift by Gokhan Mutlu on 17.10.2024

import Foundation

struct Post: Decodable{
	
	let userID:Int
	let id:Int
	let title:String
	//let body:String? //not using it
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.userID = try container.decode(Int.self, forKey: .userID)
		self.id = try container.decode(Int.self, forKey: .id)
		self.title = try container.decode(String.self, forKey: .title)
	}
	
	private enum CodingKeys: String, CodingKey{
		case userID = "userId"
		case id, title	//, body
	}
}

