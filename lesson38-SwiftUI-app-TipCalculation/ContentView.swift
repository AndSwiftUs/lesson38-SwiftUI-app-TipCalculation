import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 20.0
    @State private var numbersOfPeople = 1
    @State private var tipPercentage = 20
    
    private let tipPercentages = [5, 10, 15, 20, 25, 30, 0]
    private let numbersOfPeopleArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    var body: some View {
        VStack {
            
            Group {
                Divider()
                Text("Tip calculation")
                    .font(.title)
                    .bold()
                    .foregroundColor(.blue)
                    .padding()
                Divider()
            }
            
            HStack {
                Text("Enter amount: ")
                    .padding()
                
                TextField("Enter check amount",
                          value: $checkAmount,
                          format: .currency(code: Locale.current.currencyCode ?? "USD"))
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            Group {
                Divider().fixedSize()
                HStack {
                    Text("How many persons: ")
                        .padding()
                    Picker("How many", selection: $numbersOfPeople) {
                        ForEach(numbersOfPeopleArray, id: \.self) { number in
                            Text(number, format: .number)
                        }
                    }
                }
            }
            
            Divider().fixedSize()
            
            HStack {
                Text("Select tips: ")
                Picker("Choose tip amount", selection: $tipPercentage) {
                    ForEach(tipPercentages, id: \.self) { percentage in
                        Text(percentage, format: .percent)
                    }
                }
                Text("or enter digits")
                TextField("Enter check amount",
                          value: $tipPercentage,
                          format: .percent)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            Group {
                Divider()
                Image(systemName: "dollarsign.circle.fill")
                    .foregroundColor(.red)
                    .font(.largeTitle)
                    .padding()
            }
            
            let all = checkAmount + (checkAmount * Double(tipPercentage) / 100)
            
            Text("Total: ")
                .font(.title)
            + Text(all,
                   format: .currency(code: Locale.current.currencyCode ?? "USD"))
            .bold()
            .font(.title)
            
            if numbersOfPeople > 1 {
                Text("about ")
                + Text(all / Double(numbersOfPeople), format: .currency(code: Locale.current.currencyCode ?? "USD"))
                + Text(" per person")
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
