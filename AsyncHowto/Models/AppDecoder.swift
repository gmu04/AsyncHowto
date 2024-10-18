// AppDecoder.swift by Gokhan Mutlu on 17.10.2024

import Foundation

class AppDecoder{
	
	static func decodePostsDataToArray(_ data: Data) -> [Post]{
		let decoder = JSONDecoder()
		do{
			let posts = try decoder.decode([Post].self, from: data)
			return posts
		}catch{
			print("ERR: \(error)")
		}
		return []
	}
}
