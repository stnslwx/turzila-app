import SwiftUI

struct CarDetailsView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 0, alignment: nil),
        GridItem(.flexible(), spacing: 0, alignment: nil),
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center){
                
                Image("car")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
                
                Text("RENO SPORT")
                    .font(.system(.title, design: .default, weight: .regular))
                    .padding(.horizontal, 10)
                
                LazyVGrid(columns: columns) {
                    Option(name: "Лимит", value: "250 км", imageName: "speedometer")
                    Option(name: "Топливо", value: "Дизель", imageName: "fuelpump.fill")
                    Option(name: "Трансмиссия", value: "ручная", imageName: "gearshape.fill")
                    Option(name: "год выпуска", value: "2017", imageName: "calendar")
                }
                .frame(maxWidth: 360)
                .padding(.vertical, 10)
                
                Text("Дополнительные опции:")
                    .padding(.horizontal, 10)
                
                LazyVGrid(columns: columns) {
                    Option(name: "КАСКО", value: "БЕСПЛАТНО", imageName: "list.bullet.circle")
                    Option(name: "Доставка", value: "БЕСПЛАТНО", imageName: "list.bullet.circle")
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
                        Text("0 $")
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
    
    var body: some View {
        VStack(alignment: .leading){
            Image(systemName: "\(imageName)")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.gray)
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
        CarDetailsView()
    }
}
