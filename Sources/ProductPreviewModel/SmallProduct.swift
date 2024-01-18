import Foundation

public struct SmallProduct: Codable {
	public let name: String
	public let brand: String?
	public let barcode: String
	public let energy: Int
	public let quantity: Quantity?
	public let serving: String?
	public let source: DataSource
	
	public init(name: String, brand: String?, barcode: String, energy: Int, quantity: Quantity?, serving: String?, source: DataSource) {
		self.name = name
		self.brand = brand
		self.barcode = barcode
		self.energy = energy
		self.quantity = quantity
		self.serving = serving
		self.source = source
	}
}
