//
//  ViewController.swift
//  Calendar4
//
//  Created by  max on 08/11/2018.
//  Copyright © 2018  max. All rights reserved.
//

import UIKit
import CalendarDateRangePicker



class ViewController: UIViewController {
    
@objc public var sDate: Date! = Date()

    @IBOutlet weak var dateRangeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     
    }

    @IBAction func didTapButton(_ sender: Any) {
        
        let dateRangePickerViewController = CalendarDateRangePickerViewController(collectionViewLayout: UICollectionViewFlowLayout())
        dateRangePickerViewController.delegate = self
//        dateRangePickerViewController.minimumDate = Date()
//        dateRangePickerViewController.maximumDate = Calendar.current.date(byAdding: .year, value: 2, to: Date())
//        dateRangePickerViewController.selectedStartDate = Date()
        /*
         Set disabled dates if you want. It's optional...
         
         */
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
//        dateRangePickerViewController.minimumDate = Date()
        
        // Min and Max days
        let components = Calendar.current.dateComponents([.year, .month], from: Date())
        dateRangePickerViewController.minimumDate = Calendar.current.date(from: components)!
        dateRangePickerViewController.maximumDate = Calendar.current.date(byAdding: .year, value: 2, to: Date())
        
        
        // Select start and end Range
        
        dateRangePickerViewController.selectedStartDate = sDate
        dateRangePickerViewController.selectedEndDate = Calendar.current.date(byAdding: .day, value: 7, to: sDate)
        

//        while dateRangePickerViewController.maximumDate >= dateRangePickerViewController.minimumDate {
//            print("hghgg")
//
//        }

        
//      dateRangePickerViewController.selectedColor = UIColor.red
        dateRangePickerViewController.title = "Select Date Range"
        
        let navigationController = UINavigationController(rootViewController: dateRangePickerViewController)
        self.navigationController?.present(navigationController, animated: true, completion: nil)
        print ("vrgggtgt")
    }
    
}

extension ViewController : CalendarDateRangePickerViewControllerDelegate {
    func didTapCancel() {
        
    }
    
    func didTapDoneWithDateRange(startDate: Date!, endDate: Date!) {

        
    }
    
    
    func didCancelPickingDateRange() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func didPickDateRange(startDate: Date!, endDate: Date!) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        dateRangeLabel.text = dateFormatter.string(from: startDate) + " to " + dateFormatter.string(from: endDate)
        self.navigationController?.dismiss(animated: true, completion: nil)
        

        
    }
    
    @objc func didSelectStartDate(startDate: Date!){
        //        Do something when start date is selected...
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        print(dateFormatter.string(from: startDate))
         sDate = startDate

    }
    
    @objc func didSelectEndDate(endDate: Date!){
        //        Do something when end date is selected...
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        print(dateFormatter.string(from: endDate))
    }
}
