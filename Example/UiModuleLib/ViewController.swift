//

import UIKit
import UiModuleLib


struct Characters:Decodable {
    let identifier: Int
    let name: String
    let status: String
    let species: String
    let image: String
    let gender: String
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case status
        case species
        case image
        case gender
    }
    
}
class ViewController: UIViewController {
var table = UITableView()
var characterList :  [Characters] = [Characters(identifier: 1, name: "prueba", status: "prueba", species: "prueba", image: "https://media.istockphoto.com/photos/empty-factory-background-picture-id1054970496?k=20&m=1054970496&s=612x612&w=0&h=0gEgnLjTm_Ffr4_aKmK08yZucKNr6U7qHDs2QX5YsyY=", gender: "prueba")]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(table)
        
        table.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        table.register(Cell.self, forCellReuseIdentifier: "1")
        table.dataSource = self
        table.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = table.dequeueReusableCell(withIdentifier: "1") as! Cell
        
       
        var sd = characterList[indexPath.row]
        cell.set(image: sd.image, name: sd.name, status: sd.status)
    
        cell.prepare()
        return cell
        
    }
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
