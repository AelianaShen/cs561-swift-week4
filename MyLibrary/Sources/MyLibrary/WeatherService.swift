import Alamofire

public protocol WeatherService {
    func getTemperature() async throws -> Int
}

enum BaseUrl : String {
    case openweathermap = "https://api.openweathermap.org"
    case mockServer = "http://localhost:3000"
}

class WeatherServiceImpl: WeatherService {
    let url = "\(BaseUrl.mockServer.rawValue)/data/2.5/weather?q=corvallis&units=imperial&appid=67979b31f4afc081ec0e076f8f434aff"

    func getTemperature() async throws -> Int {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url, method: .get).validate(statusCode: 200..<300).responseDecodable(of: Weather.self) { response in
                switch response.result {
                case let .success(weather):
                    let temperature = weather.main.temp
                    let temperatureAsInteger = Int(temperature)
                    continuation.resume(with: .success(temperatureAsInteger))

                case let .failure(error):
                    continuation.resume(with: .failure(error))
                }
            }
        }
    }
}

struct Weather: Decodable {
    let main: Main

    struct Main: Decodable {
        let temp: Double
    }
}
