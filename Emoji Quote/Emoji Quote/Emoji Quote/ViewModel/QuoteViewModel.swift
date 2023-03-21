
import Foundation

class QuoteViewModel: ObservableObject {
    @Published var quoteModel: QuoteModel = QuoteModel.defaultQuote()
    
    func getRandomQuote() {
        getQuote(urlString: "https://api.quotable.io/random")
    }
    
    func offlineQuote() {
        let quoteList = [
            "Love is blind; friendship closes its eyes.",
            "The mind is everything. What you think you become.",
            "Every gift from a friend is a wish for your happiness.",
            "A life spent making mistakes is not only more honorable, but more useful than a life spent doing nothing.",
            "The best and most beautiful things in the world cannot be seen, nor touched... but are felt in the heart.",
            "We cannot do everything at once, but we can do something at once.",
            "The thought manifests as the word. The word manifests as the deed. The deed develops into habit. And the habit hardens into character.",
            "Work for something because it is good, not just because it stands a chance to succeed.",
            "The extreme limit of wisdom, that's what the public calls madness."
        ]
        
        let randomQuote: String = quoteList.randomElement() ?? "Every gift from a friend is a wish for your happiness."
        
        self.quoteModel = .defaultQuote(content: randomQuote)
        
        print("***** LEAVING OFFLINE QUOTE *****")
    }
    
    func getQuote(urlString: String) {
        // Try to get url
        guard let url = URL(string: urlString) else { return }
        
        // Send get request from quote API
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Try to get data and any error information
        let task = URLSession.shared.dataTask(with: request)
        {
            (data, response, error) in
            let jsonDecoder = JSONDecoder()
            // This is called only if error is not nil
            if let error = error {
                print(error)
                return
            }
            
            // Get data if it is not nil
            guard let data = data else {
                print("data was nil")
                return
            }
            
            do {
                let newQuoteModel = try jsonDecoder
                    .decode(QuoteModel.self, from: data)
                
                // Crucial step - update quoteModel
                DispatchQueue.main.async {
                    self.quoteModel = newQuoteModel
                    
                    print(newQuoteModel.content)
                }
                
            } catch {
                // Use offline quote if we are blocked
                DispatchQueue.main.async {
                    self.offlineQuote()
                }
            }
        }
        task.resume()
    }
}
