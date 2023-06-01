import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var bankSelectionControl: UISegmentedControl!
    
    @IBOutlet weak var cardSelectionPicker: UIPickerView!
    
    var options: [[(String, UIImage)]] = []
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set initial options based on default bank selection
            updateOptions(for: bankSelectionControl.selectedSegmentIndex)
            
            // Configure the cardSelectionPicker UIPickerView
            cardSelectionPicker.dataSource = self
            cardSelectionPicker.delegate = self
        }
        
        // MARK: - UIPickerViewDataSource
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return options[pickerView.tag].count
        }
        
        // MARK: - UIPickerViewDelegate
        
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return 60.0
        }
        
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            let optionLabel = UILabel()
            optionLabel.textAlignment = .center
            
            let optionStackView = UIStackView()
            optionStackView.axis = .horizontal
            optionStackView.spacing = 10.0
            optionStackView.alignment = .center
            
            let optionImageView = UIImageView(image: options[pickerView.tag][row].1)
            optionImageView.contentMode = .scaleAspectFit
            optionStackView.addArrangedSubview(optionImageView)
            
            optionLabel.text = options[pickerView.tag][row].0
            optionStackView.addArrangedSubview(optionLabel)
            
            return optionStackView
        }
        
        // MARK: - Helper Methods
        
        @IBAction func bankSelectionChanged(_ sender: UISegmentedControl) {
            let selectedIndex = sender.selectedSegmentIndex
            updateOptions(for: selectedIndex)
            cardSelectionPicker.reloadAllComponents()
        }
        
        func updateOptions(for selectedIndex: Int) {
            // Select bank
            switch selectedIndex {
            case 0: // Bank 1 options
                options = [
                    [("Freedom Unlimited", UIImage(named: "freedomUnlimited")!)] //, ("Card 1B", UIImage(named: "card1b")!), ("Card 1C", UIImage(named: "card1c")!)],
                ]
            case 1: // Bank 2 options
                options = [
                    [("Discover It", UIImage(named: "discoverIt")!)]//, ("Card 2B", UIImage(named: "card2b")!), ("Card 2C", UIImage(named: "card2c")!)],
                ]
            default:
                options = []
            }
            
            cardSelectionPicker.reloadAllComponents()
        }
    }
