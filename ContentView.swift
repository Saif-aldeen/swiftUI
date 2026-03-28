import SwiftUI

struct ContentView: View {
    @State private var guess = ""
    @State private var randomNumber = Int.random(in: 1...100)
    @State private var message = ""
    @State private var attempts = 0

    var body: some View {
        VStack {
            Text("Welcome to the Guess Number Game!")
                .font(.largeTitle)
                .padding()

            Text("Guess a number between 1 and 100")
                .padding()

            TextField("Enter your guess", text: $guess)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: checkGuess) {
                Text("Submit")
            }
            .padding()

            Text(message)
                .padding()

            Text("Attempts: \(attempts)")
                .padding()
        }
        .padding()
    }

    func checkGuess() {
        guard let userGuess = Int(guess) else {
            message = "Please enter a valid number."
            return
        }
        attempts += 1

        if userGuess < randomNumber {
            message = "Higher!"
        } else if userGuess > randomNumber {
            message = "Lower!"
        } else {
            message = "Congratulations! You guessed the right number! It was \(randomNumber) in \(attempts) attempts."
            resetGame()
        }
    }

    func resetGame() {
        randomNumber = Int.random(in: 1...100)
        attempts = 0
        guess = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}