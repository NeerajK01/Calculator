//
//  ViewController.swift
//  Calculator
//
//  Created by Neeraj kumar on 02/08/19.
//  Copyright © 2019 prolifics. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var theNumber: UILabel!
    var number: String = ""
    var oprtr: String = ""
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    
    @IBOutlet weak var collectionView: UICollectionView!
    let array:[String] = ["7","8","9","+","4","5","6","-","1","2","3","*","c","0","=","/"]
    override func viewDidLoad() {
        super.viewDidLoad()
       
        printNumber()
    }
    
    func printNumber(){
        theNumber.text = number
    }
    
    func result(oprt: String){
        guard let two = Int(number) else{
            return
        }
        secondNumber = two
        switch oprt {
        case "+":
            let result = firstNumber + secondNumber
            number = "\(result)"
            printNumber()
        case "-":
            let result = firstNumber - secondNumber
            number = "\(result)"
            printNumber()
        case "*":
            let result = firstNumber * secondNumber
            number = "\(result)"
            printNumber()
        case "/":
            let result = firstNumber / secondNumber
            number = "\(result)"
            printNumber()
        default:
            print("Check Again")
        }
    }
    
    func getValue(index: Int){
        var getValue: String = ""
        var first: String = ""
        getValue = self.array[index]
        
        if getValue != "+" && getValue != "-" && getValue != "*" && getValue != "/" && getValue != "="{
            number += getValue
        }else{
            printNumber()
        }
        if getValue == "c"{
            number = ""
            firstNumber = 0
            secondNumber = 0
        }
        if getValue == "+"{
            oprtr = getValue
            self.callDH()
            number = ""
        }
        if getValue == "-"{
            oprtr = getValue
            self.callDH()
            number = ""
        }
        if getValue == "*"{
            print("multiply")
            oprtr = getValue
            self.callDH()
            number = ""
        }
        if getValue == "/"{
            oprtr = getValue
            self.callDH()
            number = ""
        }
        if getValue == "="{
            if oprtr == "+"{
                result(oprt: oprtr)
            }else if oprtr == "-"{
                result(oprt: oprtr)
            }else if oprtr == "*"{
                result(oprt: oprtr)
            }else if oprtr == "/"{
                result(oprt: oprtr)
            }else{
                print("wrong choice...")
            }
        }
        
        printNumber()
        
    }
    
    func callDH(){
        guard let one = Int(number) else{
            return
        }
        firstNumber = one
        
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.cellLabel.text = self.array[indexPath.row]
        cell.selectedBackgroundView = UIView(frame: cell.bounds)
        cell.selectedBackgroundView!.backgroundColor = .yellow
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.getValue(index: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let noOfCellsInRow = 4
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        
        return CGSize(width: size, height: size)
    }
    
}
