//
//  QuestionsView.swift
//  QuizzApp3
//
//  Created by Iva Bogdanovic Radovic on 06/07/2020.
//  Copyright © 2020 Filip Radović. All rights reserved.
//

import UIKit

class QuestionsView: UIView {
    let stackView = UIStackView()
    let scrollView = UIScrollView()
    let screenSize: CGRect = UIScreen.main.bounds
    var questions : [QuizView] = []
    
    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.commonInit()
    }

    private func commonInit() {
        self.addSubview(self.scrollView)
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
        self.scrollView.isScrollEnabled = false
        self.scrollView.delaysContentTouches = false
        self.scrollView.isMultipleTouchEnabled = false
        self.scrollView.isUserInteractionEnabled = true
        
        //Constrain scroll view
        self.scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true;
        self.scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true;
        self.scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true;
        self.scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true;
        
        self.scrollView.addSubview(self.stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.axis = .horizontal
        //constrain stack view to scroll view
        
        self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 0).isActive = true;
        self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 0).isActive = true;
        self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: 0).isActive = true;
        self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 0).isActive = true;
    }
    
    func populateQuestions(quiz: Quiz){
        for question in quiz.questions{
            let questionView = QuizView()
            questionView.questionInit(question: question)
            questionView.translatesAutoresizingMaskIntoConstraints = false
            questionView.widthAnchor.constraint(equalToConstant: self.screenSize.width).isActive = true;
            self.stackView.addArrangedSubview(questionView)
        }
        self.scrollView.contentSize.width = CGFloat(quiz.questions.count) * self.screenSize.width
        self.scrollView.contentSize.height = self.screenSize.height
    }

}
