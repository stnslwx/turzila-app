import SwiftUI

struct CalculatorView: View {
    
    @State var selectedDate: Date = Date()
    @State var daysAmount: Int = 1
    
    @State var fullName: String = ""
    @State var address: String = ""
    @State var phoneNumber: String = "+"
    @State var email: String = ""
    
    @State var birthDate: Date = Date()
    
    var cost: Int = 50
    
    var finalCost: Int {
        return cost * daysAmount
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image("car")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(height: 200)
                    .shadow(radius: 10)
                
                Text("FORD MUSTANG")
                    .font(.system(.title2, design: .default, weight: .bold))
                
                PriceDispaly(text: "Стоимость суток", price: "\(cost)")
                
                Stepper(value: $daysAmount, in: 0...Int.max, label: {
                    Text("Количество суток: \(daysAmount)")
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                })
                
                DatePicker("Дата начала аренды", selection: $selectedDate, displayedComponents: [.date])
                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                
                TimeSelectionCheckBoxes(dayTime: true, nightTime: false)
                
                VStack{
                    CustomTextField(text: $phoneNumber, label: "Номер телефона", placeholder: "", keyboardType: .namePhonePad)
                    CustomTextField(text: $email, label: "Электронная почта", placeholder: "Электронная почта", keyboardType: .emailAddress)
                    CustomTextField(text: $address, label: "Адрес", placeholder: "Адрес доставки или название Отеля", keyboardType: .namePhonePad)
                    CustomTextField(text: $fullName, label: "Фамилия и имя", placeholder: "Имя Фамилия на латинице", keyboardType: .emailAddress)
                    
                }
                .padding(.bottom, 20)
                
                DatePicker("Дата рождения", selection: $birthDate, displayedComponents: [.date])
                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                
                VStack(alignment:.center){
                    VStack(alignment: .leading) {
                        PriceDispaly(text: "Всего к оплате", price: "\(finalCost)")
                        PriceDispaly(text: "К оплате сейчас", price: "10")
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 20)
                
                Button {
                    print("CalculatorView button")
                } label: {
                    Text("АРЕНДОВАТЬ")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .frame(width: 300, height: 50)
                        .foregroundColor(Color.white)
                        .background(Color("universalGreen"))
                        .cornerRadius(10)
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 30)
            }
            .padding()
        }
    }
}


struct PriceDispaly: View {
    
    var text: String
    var price: String
    
    var body: some View {
        HStack {
            Text("\(text):")
                .font(.system(size: 18, weight: .bold, design: .monospaced))
            Text("\(price)$")
                .foregroundColor(Color("universalGreen"))
                .font(.system(size: 20, weight: .bold, design: .rounded))
        }
    }
}

struct TimeSelectionCheckBoxes: View {
    
    @State var dayTime: Bool
    @State var nightTime: Bool
    
    var body: some View {
        VStack {
            Text("Время доставки")
                .font(.system(size: 18, weight: .bold, design: .monospaced))
            Toggle(isOn: $dayTime) {
                Text("Доставка утром (9:00-11:00)")
                    .padding(.vertical, 5)
                    .padding(.leading, 20)
            }.toggleStyle(SwitchToggleStyle(tint: Color("universalGreen")))
            Toggle(isOn: $nightTime) {
                Text("Доставка вечером (20:00-22:00)")
                    .padding(.vertical, 5)
                    .padding(.leading, 20)
            }.toggleStyle(SwitchToggleStyle(tint: Color("universalGreen")))
        }
        .onChange(of: dayTime) { newValue in
            nightTime = !newValue
                }
        .onChange(of: nightTime) { newValue in
                    dayTime = !newValue
        }
        .padding(.horizontal,15)
        .padding(.vertical, 20)
    }
}

struct CustomTextField: View {
    
    @Binding var text: String
    var label: String
    var placeholder: String
    var keyboardType: UIKeyboardType
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(label)")
            TextField(placeholder, text: $text)
                        .keyboardType(keyboardType)
                        .padding()
                        .background(Color("universalGreen").opacity(0.1))
                        .cornerRadius(8)
        } .padding(.horizontal)
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
