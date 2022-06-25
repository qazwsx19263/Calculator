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
        numpadStackView.addSubview(numpadBG)
        self.view.addSubview(numLabelBG)
        self.view.addSubview(numpadBG)
        setupNumLabel()
        setupNumpad()
    }
    
    func setupNumLabel(){
        let guide=view.safeAreaLayoutGuide
        numLabelBG.translatesAutoresizingMaskIntoConstraints = false
        numLabel.translatesAutoresizingMaskIntoConstraints = false
        
        numLabelBG.backgroundColor = .lightGray
        numLabelBG.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        numLabelBG.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        numLabelBG.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        numLabelBG.heightAnchor.constraint(equalToConstant: 238).isActive = true
        // MARK: setup number label position and
        numLabel.backgroundColor = .red  //recognize
        numLabel.text = "0"
        numLabel.font = numLabel.font.withSize(64)
        numLabel.textAlignment = .right
        numLabel.adjustsFontSizeToFitWidth = true
        numLabel.topAnchor.constraint(equalTo: numLabelBG.topAnchor, constant: 138).isActive = true
        numLabel.bottomAnchor.constraint(equalTo: numLabelBG.bottomAnchor).isActive = true
        numLabel.trailingAnchor.constraint(equalTo: numLabelBG.trailingAnchor).isActive = true
        numLabel.leadingAnchor.constraint(equalTo: numLabelBG.leadingAnchor).isActive = true
    }
    func setupNumpad(){
        numpadBG.backgroundColor = .darkGray
        numpadBG.translatesAutoresizingMaskIntoConstraints = false
        numpadBG.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        numpadBG.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        numpadBG.topAnchor.constraint(equalTo: numLabelBG.bottomAnchor).isActive = true
        numpadBG.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let button = UIButton()
          button.setTitle("btn 1", for: .normal)
          button.backgroundColor = UIColor.red
          button.translatesAutoresizingMaskIntoConstraints = false

          let button2 = UIButton()
          button2.setTitle("btn 2", for: .normal)
          button2.backgroundColor = UIColor.gray
          button2.translatesAutoresizingMaskIntoConstraints = false

          let button3 = UIButton()
          button3.setTitle("btn 3", for: .normal)
          button3.backgroundColor = UIColor.brown
          button3.translatesAutoresizingMaskIntoConstraints = false
      
        numpadStackView.alignment = .fill
        numpadStackView.distribution = .fillEqually
        numpadStackView.spacing = 8
        
        numpadStackView.addSubview(button)
        numpadStackView.addSubview(button2)
        numpadStackView.addSubview(button3)
        
        
        
    }
    @objc func plusAction(sender:UIButton!){
        print("this is plus button")
        numLabel.text="plus"
    }
//
//    @objc func calculateAction(sender:UIButton!, type:String){
//        switch type{
//        case "+":
//            print("this is plus button")
//        case "-":
//            print("this is minus button")
//        case "*":
//            print("this is multiply button")
//        case "/":
//            print("this is divide button")
//        default:
//            break
//        }
//    }
}

