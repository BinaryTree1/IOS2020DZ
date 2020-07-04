import UIKit

class QuizzQuestionsVC: UIViewController {

    @IBOutlet weak var QuizName: UILabel!
    
    var quizz : Quiz?
    var image : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.QuizName.text = quizz?.title
    }

}
