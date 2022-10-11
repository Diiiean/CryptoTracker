import Foundation

extension Double {
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .decimal
        formatter.formatterBehavior = .default
        return formatter
    }
    func asCurrencyWithFormatter() -> String {
        let number = NSNumber(value: self)
        let currString = currencyFormatter2.string(from: number) ?? "$0.00"
        return currString 
    }
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
}
