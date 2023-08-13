import Foundation

final class CarViewModel: ObservableObject {
    @Published var cars: [Car] = []
    
    func getCars(){
        let carURL = ""
        
        if let url = URL(string: carURL) {
            URLSession.shared.dataTask(with: url){[weak self] data, response, error in
                if let error = error{
                    print(error)
                } else {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    if let data = data,
                       let cars = try? decoder.decode([Car].self, from: data){
                        //TODO: HANDLE SETTING THE DATA
                        self?.cars = cars
                    }else{
                        //TODO: HANDLE ERROR
                    }
                }
            }.resume()
        }
    }
}
