import UIKit

class QuizzQuestionsVC: UIViewController {

    @IBOutlet weak var QuizName: UILabel!
    @IBOutlet weak var questionsView: QuestionsView!
    @IBOutlet weak var StartQuizz: UIButton!
    @IBOutlet weak var QuizzImage: UIImageView!
    
    var quizz : Quiz?
    var image : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.QuizName.text = quizz?.title
        self.QuizzImage.image = self.image
        self.questionsView.populateQuestions(quiz: quizz!)
        self.questionsView.translatesAutoresizingMaskIntoConstraints = false
        self.questionsView.topAnchor.constraint(equalTo: self.StartQuizz.bottomAnchor, constant: 20).isActive = true;
    }

}
