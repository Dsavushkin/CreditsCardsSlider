//
//  ViewController.swift
//  MyApplicationToday
//
//  Created by Дмитрий on 16/11/2019.
//  Copyright © 2019 Дмитрий. All rights reserved.
//

import UIKit

extension UIColor{
    static var mainColor = UIColor (red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Золотая карта от Фора банка", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        
        attributedText.append(NSAttributedString(string: "\n\n\nЗолотая карта от Фора банка", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor:
            UIColor.gray]))
        
        textView.attributedText = attributedText


        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable =  false
        textView.isScrollEnabled = false
        return textView
    }()
     
    private let previusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("НАЗАД", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    private let nextButton: UIButton = {
         let button = UIButton(type: .system)
         button.setTitle("ВПЕРЕД", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainColor, for: .normal)

         return button
     }()
    
    private let pageControls: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainColor
        pc.pageIndicatorTintColor = UIColor (red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomControls()
        // Do any additional setup after loading the view.
        view.addSubview(descriptionTextView)
        setupLayout()
        
        
    }
    
    public func setupBottomControls(){
       
       
//        let greenView = UIView()
//        greenView.backgroundColor = .green
        
//        let yellowView = UIView()
//        yellowView.backgroundColor = .yellow
//
//        let blueView = UIView()
//        blueView.backgroundColor = .blue
        
        let bottomControlsStackContainer = UIStackView(arrangedSubviews: [previusButton, pageControls, nextButton])
    
        bottomControlsStackContainer.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackContainer.distribution = .fillEqually
    

        view.addSubview(bottomControlsStackContainer)
//         bottomControlsStackContainer.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        
      NSLayoutConstraint.activate([
      //            previousButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                  bottomControlsStackContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                  bottomControlsStackContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                  bottomControlsStackContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                  bottomControlsStackContainer.heightAnchor.constraint(equalToConstant: 50)
                  ])
    
    }

    private func setupLayout() {
        
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        topImageContainerView.addSubview(imageView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        
        imageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
    
        
        // set descriptionTextView Constrainst
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 0).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
    }

}

