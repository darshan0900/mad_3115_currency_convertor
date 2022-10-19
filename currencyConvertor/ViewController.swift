//
//  ViewController.swift
//  currencyConvertor
//
//  Created by Darshan Jain on 2022-10-17.
//

import UIKit

class ViewController: UIViewController {

	static let SUPPORTED_CURRENCIES = ["CAD", "USD"]
	
	static let USD_VALUE:Float = 0.73
	
	@IBOutlet var currencyLabels: [UILabel]!
	
	@IBOutlet var currencyInput: [UITextField]!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
		tap.cancelsTouchesInView = false
		view.addGestureRecognizer(tap)
		
		for (i, label) in currencyLabels.enumerated() {
			if( ViewController.SUPPORTED_CURRENCIES.indices.contains(i)){
				label.text = ViewController.SUPPORTED_CURRENCIES[i]
			}
		}
	}
	
	@IBAction func onSwapPress(_ sender: UIButton) {
		let labels: [String] = currencyLabels.map({$0.text ?? ""}).reversed()
		let values:[String] = currencyInput.map({$0.text ?? ""}).reversed()
		
		for i in currencyLabels.startIndex..<currencyLabels.endIndex{
			currencyLabels[i].text = labels[i]
			currencyInput[i].text = values[i]
		}
	}
	
	
	@IBAction func onFirstCurrencyChanged(_ sender: UITextField) {
		let currencyLabel = currencyLabels[0].text!
		let currency = sender.text!
		let amount = calculateOtherCurrency(currencyLabel: currencyLabel, input: currency)
		if amount.count>0{
			currencyInput[1].text = amount
		}
	}
	
	@IBAction func onSecondCurrencyChanged(_ sender: UITextField) {
		let currencyLabel = currencyLabels[1].text!
		let currency = sender.text!
		let amount = calculateOtherCurrency(currencyLabel: currencyLabel, input: currency)
		if amount.count>0{
			currencyInput[0].text = amount
		}
	}
	
	func calculateOtherCurrency(currencyLabel: String, input: String) -> String {
		if let amount = Float(input){
			var secondCurrency: Float = 0.0
			if(currencyLabel=="USD"){
				secondCurrency = 1/ViewController.USD_VALUE * amount
			}else{
				secondCurrency = amount * ViewController.USD_VALUE
			}
			return "\(round(secondCurrency*1000)/1000.0)"
		}
		return ""
	}
	
}

