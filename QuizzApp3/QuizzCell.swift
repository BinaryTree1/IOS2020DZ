import UIKit

class QuizzCell: UITableViewCell {
    @IBOutlet weak var ImageQuizz: UIImageView!
    @IBOutlet weak var TitleQuizz: UILabel!
    @IBOutlet weak var TrackQuizz: UIProgressView!
    @IBOutlet weak var TextQuizz: UITextView!
    
    func setQuizz(quizz: Quiz, image: UIImage){
        
        TitleQuizz.text = quizz.title
        TextQuizz.text = quizz.quizDescription
        switch quizz.level {
            case 1:
                TrackQuizz.progress = 0.333
            case 2:
                TrackQuizz.progress = 0.666
            case 3:
                TrackQuizz.progress = 1
            default:
                TrackQuizz.progress = 0
        }
        ImageQuizz.image = image
    }
}
