import Foundation
import ProductPreviewModel

public protocol SmallProductConvertable {
	func getNames() -> [Language: String]
	func getBrand() -> String?
	func getId() -> String
	func getEnergy() -> Int
	func getQuantity() -> Quantity?
	func getServing() -> String?
}
