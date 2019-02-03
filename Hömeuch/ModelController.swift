import UIKit

class ModelController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var interestRate: Double
    var taxesAverage: Double
    var monthlyIncome: Double
    var monthlyDebt: Double
    var downPayment: Double
    var insurance: Double
    var year: Double
    
    var actualDebt: Double = 0.0
    var monthlyPayment : Double = 0.0
    var DBI: Double = 0.0
    var monthlyCashAfter41: Double = 0.0
    var priceOfAHome: Double = 0.0
    var percentageAvailableforMortgage: Double = 0.0
    
    init(interestRate: Double, taxesAverage: Double, monthlyIncome: Double, monthlyDebt: Double, downPayment: Double, year: Double, insurance: Double) {
        
        self.interestRate = interestRate
        self.taxesAverage = taxesAverage
        self.monthlyIncome = monthlyIncome
        self.monthlyDebt = monthlyDebt
        self.downPayment = downPayment
        self.year = year
        self.insurance = insurance
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func debtToIncome() -> Double {
        DBI = monthlyDebt / monthlyIncome
        return DBI
    }
    
    public func moneyLeftForMortgage() -> Double {
        percentageAvailableforMortgage = 0.41 - DBI
        let cash41 = percentageAvailableforMortgage * monthlyIncome - monthlyDebt
        
        monthlyCashAfter41 = cash41
        
        return monthlyCashAfter41
    }
    
    public func monthlyPayCalc() -> Double {
        let r : Double = interestRate / 1200
        let n : Double = year * 12
        priceOfAHome = downPayment + ((monthlyCashAfter41) - ((taxesAverage) / 12) - ((insurance) / 12)) / ((r * pow((1 + r), n)) / (pow((1 + r), n) - 1))
        return priceOfAHome
    }
    
    public func loanAmount() -> Double {
        actualDebt = priceOfAHome - downPayment
        return actualDebt
    }
    
    public func monthlyPaymentsCalc() -> Double {
        monthlyPayment = (actualDebt * (interestRate / 12)) / (1 - (1 / pow(1 + interestRate, year * 12))) // year?????
        
        return monthlyPayment
    }
    
    public func amortizationSchedule() -> Double {
        
        return 0
    }
}
