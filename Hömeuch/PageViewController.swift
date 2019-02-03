import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
   
    lazy var pageViewControllers: [UIViewController] = {
        
        return [self.newVC(viewController: "first"), self.newVC(viewController: "second"), self.newVC(viewController: "third"),  self.newVC(viewController: "fourth"), self.newVC(viewController: "results")]
    }()
    
    func newVC(viewController: String) -> UIViewController {
        
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.dataSource = self
        
        if let firstViewController = pageViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }

    func calculate () {
        
        let interestRate: Double = 5.0
        let taxesAverage: Double = 4000.0
        let insurance: Double = 2000.0
        let year: Double = 30.0
        
        var modelController = ModelController(interestRate: interestRate, taxesAverage: taxesAverage, monthlyIncome: monthlyIncome, monthlyDebt: monthlyDebt, downPayment: downPayment, year: year, insurance: insurance)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = pageViewControllers.firstIndex(of: viewController) else { return nil}
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else { return nil}
        
        guard pageViewControllers.count > previousIndex else {
            return nil
        }
        
        return pageViewControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    
        guard let viewControllerIndex = pageViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        let orderedViewControllersCount = pageViewControllers.count

        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return pageViewControllers[nextIndex]
    }
}

public var monthlyIncome = 0.0 {
    didSet {
        print(monthlyIncome)
    }
}

public var monthlyDebt = 0.0 {
    didSet {
        print(monthlyDebt)
    }
}

public var downPayment = 0.0 {
    didSet {
        print(downPayment)
    }
}
