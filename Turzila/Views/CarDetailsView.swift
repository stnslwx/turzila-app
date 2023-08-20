import SwiftUI

struct CarDetailsView: View {
    
    let car: Car
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 0, alignment: nil),
        GridItem(.flexible(), spacing: 0, alignment: nil),
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading){
                
                Image("car")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
                
                Text("\(car.name)")
                    .font(.system(.title, design: .default, weight: .regular))
                    .padding(.horizontal, 10)
                
                LazyVGrid(columns: columns) {
                    Option(name: "Лимит", value: "250 км", imageName: "speedometer", imageColor: .blue)
                    Option(name: "Топливо", value: car.engine == 0 ? "дизель" : "бензин", imageName: "fuelpump.fill", imageColor: Color("universalGreen"))
                    Option(name: "Трансмиссия", value: car.transmission == 0 ? "ручная" : "автомат", imageName: "gearshape.fill", imageColor: Color("universalPurple"))
                    Option(name: "год выпуска", value: "\(car.year)", imageName: "calendar", imageColor: .orange)
                }
                .frame(maxWidth: 360)
                .padding(.vertical, 10)
                
                Text("Дополнительные опции:")
                    .padding(.horizontal, 10)
                
                LazyVGrid(columns: columns) {
                    Option(name: "КАСКО", value: "БЕСПЛАТНО", imageName: "checkmark.seal.fill", imageColor: Color("universalGreen"))
                    Option(name: "Доставка", value: "БЕСПЛАТНО", imageName: "checkmark.seal.fill", imageColor: Color("universalGreen"))
                }
                .frame(maxWidth: 360)
                .padding(.vertical, 10)
                
                VStack(spacing: 0){
                    Button {
                        print("Button rent-a-car has been pressed!")
                    } label: {
                        Text("Арендовать")
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .frame(width: 300, height: 50)
                            .foregroundColor(Color.white)
                            .background(Color("universalGreen"))
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 30)
                    
                    HStack{
                        Text("Стоимость суток:")
                            .font(.title3)
                        Text("\(car.price) $")
                            .font(.title2)
                            .foregroundColor(Color("universalGreen"))
                    }.padding(.top, 10)
                }
                
                Spacer()
            }
        } 
    }
}

struct Option: View {
    
    let name: String
    let value: String
    let imageName: String
    let imageColor: Color
    
    var body: some View {
        VStack(alignment: .leading){
            Image(systemName: "\(imageName)")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(imageColor)
            Text("\(name):")
                .foregroundColor(Color.gray)
            Text("\(value)")
                .font(.system(.title3, design: .monospaced, weight: .regular))
        }
        .padding(.leading, 15)
        .frame(width: 170, height: 100,alignment: .leading)
        .background{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color("universalGray"), lineWidth: 3)
        }
    }
}

struct CarDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailsView(car: Car(id: 1, name: "VEHICLE NAME", price: 0, profit: 0, year: 2000, transmission: 0, engine: 0))
    }
}
