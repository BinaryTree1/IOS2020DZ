import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var quizzes : [Quiz] = []
    var images = [String: UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getQuizzApi(completion: { [weak self] (root) in
            self?.quizzes = root.quizzes
        })
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func logoutUser(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "LoggedIn")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension HomeVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quiz = quizzes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizzCell") as! QuizzCell
        
        getImageApi(link: quiz.image, completion: { [weak self] (data) in
            self?.images[quiz.image] = UIImage(data: data)
        })
        
        cell.setQuizz(quizz: quiz, image: images[quiz.image]!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let quiz = quizzes[indexPath.row]
        let image = images[quiz.image]!
        let questionVc = self.storyboard?.instantiateViewController(withIdentifier: "QuizzQuestionsVC") as! QuizzQuestionsVC
        questionVc.image = image
        questionVc.quizz = quiz
        self.navigationController?.pushViewController(questionVc, animated: false)
    }
}

extension HomeVC {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}


