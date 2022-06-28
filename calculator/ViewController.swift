//
//  ViewController.swift
//  calculator
//
//  Created by Michael Namara on 2022/6/24.
//

import UIKit

class ViewController: UIViewController {

    let numLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//    let plusBtn = UIButton(frame: CGRect(x: 100, y:100, width:50 , height: 50))
    let numLabelBG = UIView()
    let numpadBG = UIView()
    let numpadStackView = UIStackView()
    var btnArr:[[UIButton]] = [[]]
    var stackArr:[UIStackView] = []
    let twoD:[[String]] = [["0","1","2","3","4","5","6","7","8","9"], ["AC","±","%"], ["÷","×","−","+",".","="] ]  //2-Dimension arr
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
//        numLabel.text="test"
//        plusBtn.setImage(UIImage(named: "plus"), for: .normal)
//        plusBtn.setTitle("+", for: .normal)
//        plusBtn.backgroundColor = .yellow
//        plusBtn.addTarget(self, action: #selector(plusAction), for: .touchUpInside)
//        view.addSubview(plusBtn)
//        view.addSubview(numLabel)

        numLabelBG.addSubview(numLabel)
        self.view.addSubview(numLabelBG)
//        self.view.addSubview(numpadBG)
        self.view.addSubview(numpadStackView)
        setupNumLabel()
        setupNumpad()
        
    }
    // MARK: UI design
    func setupNumLabel(){
        let guide=view.safeAreaLayoutGuide
        numLabelBG.translatesAutoresizingMaskIntoConstraints = false
        numLabel.translatesAutoresizingMaskIntoConstraints = false
        
        numLabelBG.backgroundColor = .darkGray
        numLabelBG.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        numLabelBG.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        numLabelBG.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        numLabelBG.heightAnchor.constraint(equalToConstant: 238).isActive = true
        // MARK: setup number label position and
//        numLabel.backgroundColor = .red  //recognize
        numLabel.text = "0"
        numLabel.font = numLabel.font.withSize(64)
        numLabel.textColor = .white
        numLabel.textAlignment = .right
        numLabel.adjustsFontSizeToFitWidth = true
        numLabel.topAnchor.constraint(equalTo: numLabelBG.topAnchor, constant: 138).isActive = true
        numLabel.bottomAnchor.constraint(equalTo: numLabelBG.bottomAnchor).isActive = true
        numLabel.trailingAnchor.constraint(equalTo: numLabelBG.trailingAnchor).isActive = true
        numLabel.leadingAnchor.constraint(equalTo: numLabelBG.leadingAnchor).isActive = true
    }
    
    func setupNumpad(){
        numpadStackView.translatesAutoresizingMaskIntoConstraints = false
        numpadStackView.backgroundColor = .darkGray
        numpadStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        numpadStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        numpadStackView.topAnchor.constraint(equalTo: numLabelBG.bottomAnchor).isActive = true
        numpadStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        numpadStackView.alignment = .fill
        numpadStackView.distribution = .fillEqually
        numpadStackView.spacing = 2
        numpadStackView.axis = .vertical
        
        
//        let Dict:[String:[String]] = ["numpad":["0","1","2","3","4","5","6","7","8","9","."], "operators":["+","-","*","/","="], "fn":["AC","+/-","%"]]     //Dictionary
//        let numpadArr:[String] = ["0","1","2","3","4","5","6","7","8","9",".","+","-","*","/","=","AC","+/-","%"] // Array

        
        
        for i in 0...4{
            stackArr.append(UIStackView())
            stackArr[i].translatesAutoresizingMaskIntoConstraints = false
            stackArr[i].alignment = .fill
            stackArr[i].distribution = .fillEqually
            stackArr[i].spacing = 1
            numpadStackView.addArrangedSubview(stackArr[i])
            stackArr[i].leadingAnchor.constraint(equalTo: numpadStackView.leadingAnchor).isActive = true
            stackArr[i].trailingAnchor.constraint(equalTo: numpadStackView.trailingAnchor).isActive = true
        }
        
        var cnt = 0
        let s = UIStackView()
        s.alignment = .fill
        s.distribution = .fillEqually
        for row in 0..<3{
            for col in 0..<twoD[row].count{
                btnArr[row].append(UIButton())
                btnArr[row][col].translatesAutoresizingMaskIntoConstraints = false
                btnArr[row][col].setTitle(twoD[row][col], for: .normal)
                switch row{
                case 0:
                    btnArr[row][col].backgroundColor = .black
                    switch Int(btnArr[row][col].currentTitle!)!{
                    case 7...9:
                        stackArr[1].addArrangedSubview(btnArr[row][col])
                    case 4...6:
                        stackArr[2].addArrangedSubview(btnArr[row][col])
                    case 1...3:
                        stackArr[3].addArrangedSubview(btnArr[row][col])
                    default:
                        stackArr[4].addArrangedSubview(btnArr[row][col])
                    }
                case 1:
                    btnArr[row][col].backgroundColor = .lightGray
                    stackArr[0].addArrangedSubview(btnArr[row][col])
                case 2:
                    btnArr[row][col].backgroundColor = UIColor(red: 255/255, green: 170/255, blue: 2/255, alpha: 1)
                    switch btnArr[row][col].currentTitle{
                    case ".":
                        btnArr[row][col].backgroundColor = .black
                        s.addArrangedSubview(btnArr[row][col])
                    case "=":
                        s.addArrangedSubview(btnArr[row][col])
                    default:
                        stackArr[cnt].addArrangedSubview(btnArr[row][col])
                        cnt += 1
                    }
                    stackArr[cnt].addArrangedSubview(s)
                default:
                    break
                }
            }
            btnArr.append([])
        }
    }
    
    // MARK: Funtion implementation
    
}

