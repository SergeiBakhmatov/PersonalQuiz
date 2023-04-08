//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton.toggle()
        
        let result = getResult(for: answersChosen)
        
        resultLabel.text = "Вы - \(result.rawValue)"
        definitionLabel.text = result.definition
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}

private extension ResultViewController {
    func getResult(for answersChosen: [Answer]) -> Animal {
        
        var result: Animal
        
        var answerCats: [Answer]
        var answerDogs: [Answer]
        var answerRabbit: [Answer]
        var answerTurtle: [Answer]
        
        answerCats = answersChosen.filter { $0.animal == .cat }
        answerDogs = answersChosen.filter { $0.animal == .dog }
        answerRabbit = answersChosen.filter { $0.animal == .rabbit }
        answerTurtle = answersChosen.filter { $0.animal == .turtle }
        
        if answerCats.count < answerDogs.count {
            result = .dog
        } else if answerDogs.count < answerRabbit.count {
            result = .rabbit
        } else if answerRabbit.count < answerTurtle.count {
            result = .turtle
        } else {
            result = .cat
        }
        return result
    }
}
