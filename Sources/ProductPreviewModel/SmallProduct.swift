import Foundation

public struct SmallProduct: Codable {
	public let name: String
	public let brand: String?
	public let barcode: String
	public let energy: Int
    public let measurement: ProductMeasurement
	public let source: DataSource
	
    public init(name: String, brand: String?, barcode: String, energy: Int, measurement: ProductMeasurement, source: DataSource) {
        self.name = name
        self.brand = brand
        self.barcode = barcode
        self.energy = energy
        self.measurement = measurement
        self.source = source
    }
}
