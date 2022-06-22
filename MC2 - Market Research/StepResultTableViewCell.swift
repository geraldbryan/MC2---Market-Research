//
//  StepResultTableViewCell.swift
//  MC2 - Market Research
//
//  Created by Anastasia Agustine on 19/06/22.
//

import UIKit

protocol StepResultTextViewDelegate {
    func textViewState(text: String)
}

class StepResultTableViewCell: UITableViewCell, UITextViewDelegate {

    var delegateStepResult: StepResultTextViewDelegate?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultTextView: UITextView!
    
    static var identifier: String = "StepResultTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "StepResultTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        resultLabel.textColor = UIColor(named: "colorTesting")
        resultTextView.layer.borderWidth = 0.4
        resultTextView.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let text = textView.text ?? ""
//        if text.isEmpty {
//            delegateStepResult?.textViewState(isEmpty: true)
//        } else {
//            delegateStepResult?.textViewState(isEmpty: false)
//        }
        delegateStepResult?.textViewState(text: text)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Write your research results here..."{
            textView.text = ""
        }
    }
}
