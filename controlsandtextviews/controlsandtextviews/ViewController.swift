//
//  ViewController.swift
//  controlsandtextviews
//
//  Created by ISAAC DAVID SANTIAGO on 26/04/22.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var myButton: UIButton!
    
    @IBOutlet weak var myPickerView: UIPickerView!
    
    @IBOutlet weak var myPageControl: UIPageControl!
    
    @IBOutlet weak var mySlider: UISlider!
    
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var myStepper: UIStepper!
    
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    
    @IBOutlet weak var myProgressView: UIProgressView!
    
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var mySwitchLabel: UILabel!
    
    @IBOutlet weak var myStepperLabel: UILabel!
    
    
    @IBOutlet weak var myTextField: UITextField!
    
    
    @IBOutlet weak var myTextView: UITextView!
    
    //Variabless
    
    private let myPickerViewValues = ["Uno","Dos","Tres","Cuatro","Cinco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Buttons
        myButton.setTitle("Mi botón", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
        
        //Pickers
        myPickerView.backgroundColor = .lightGray
        myPickerView.dataSource = self
        myPickerView.delegate = self
        
        //PageControls
        
        myPageControl.numberOfPages = myPickerViewValues.count
        
        myPageControl.currentPageIndicatorTintColor = .blue
        
        myPageControl.pageIndicatorTintColor = .lightGray
        
        //SegmentedControls
        
        mySegmentedControl.removeAllSegments()
        for (index, value) in myPickerViewValues.enumerated(){
            mySegmentedControl.insertSegment(withTitle:value, at:index, animated: true)
        }
        
        //Sliders
        mySlider.minimumTrackTintColor = .red
        mySlider.minimumValue = 1
        mySlider.maximumValue = Float(myPickerViewValues.count)
        
        //Stepper
        
        myStepper.minimumValue = 1
        myStepper.maximumValue = Double(myPickerViewValues.count)
        
        //Switch
        mySwitch.onTintColor = .purple
        mySwitch.isOn = true
        
        //Progress Indicators
        
        myProgressView.progress = 0
        
        myActivityIndicator.color = .orange
        myActivityIndicator.startAnimating()
        
        //Labels
        
        myStepperLabel.textColor = .darkGray
        myStepperLabel.font = UIFont.boldSystemFont(ofSize: 36)
        myStepperLabel.text = "1"
        
        mySwitchLabel.text = "Está prendido"
        
        //TextField
        myTextField.textColor = .brown
        myTextField.placeholder = "Escribe algo"
        myTextField.delegate = self
        
        //Textview
        myTextView.textColor = .brown
        myTextView.delegate = self
        
    }
    

    //Actions
    
    
    @IBAction func mySwitchAction(_ sender: Any) {
        if mySwitch.isOn{
            myPickerView.isHidden = false
            myActivityIndicator.stopAnimating()
        } else {
            myPickerView.isHidden = true
            myActivityIndicator.startAnimating()
        }
    }
    
    @IBAction func myStepperAction(_ sender: Any) {
        let value = myStepper.value
        mySlider.value = Float(value)
        let valueInt:Int = Int(value)
        myStepperLabel.text = "\(valueInt)"
    }
    
    @IBAction func mySegmentControlAction(_ sender: Any) {
        myPickerView.selectRow(mySegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
    }
    
    @IBAction func myPageControlAction(_ sender: Any) {
        myPickerView.selectRow(myPageControl.currentPage, inComponent: 0, animated: true)
    }
    
    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue{
            myButton.backgroundColor = .green
        }else{
            myButton.backgroundColor = .blue
        }
        myTextView.resignFirstResponder()
    }
    
    
    @IBAction func mySliderAction(_ sender: Any) {
        print(mySlider.value)
        var progress: Float = 0
        
        switch mySlider.value{
        case 1..<2:
            mySegmentedControl.selectedSegmentIndex = 0
        case 2..<3:
            mySegmentedControl.selectedSegmentIndex = 1
        case 3..<4:
            mySegmentedControl.selectedSegmentIndex = 2
        case 4..<5:
            mySegmentedControl.selectedSegmentIndex = 3
        default:
            mySegmentedControl.selectedSegmentIndex = 4
        }
        
        myProgressView.progress = (mySlider.value * 20) / 100
    }
    
}

extension ViewController:UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerViewValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return myPickerViewValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let myString = myPickerViewValues[row]
        myButton.setTitle(myString, for: .normal)
        
        myPageControl.currentPage = row
        
    }
}

extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        myButton.setTitle(myTextField.text, for: .normal)
        
    }
}

extension ViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        myTextField.isHidden = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        myTextField.isHidden = false
    }
}
