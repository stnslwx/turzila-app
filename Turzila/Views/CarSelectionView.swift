import SwiftUI

struct CarSelectionView: View {
    @StateObject private var vm = CarViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    ForEach(vm.cars, id: \.id) {car in
                        SelectionItem(carId:car.id, carName: car.name, carPrice: car.price, car: car)
                    }
                }
            }
        }
        .onAppear(perform: vm.getCars)
    }
}

struct SelectionItem: View {
    let carId: Int
    let carName: String
    let carPrice: Int
    let car: Car
    var body: some View {
        VStack{
            Image("car")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .overlay(alignment: .bottom) {
                    HStack(){
                        Text("\(carName)")
                            .font(.system(.title3, design: .default, weight: .regular))
                            .textCase(.uppercase)
                        Spacer()
                        Text("\(carPrice)$")
                            .font(.system(.title3, design: .monospaced, weight: .bold))
                            .foregroundColor(Color("universalGreen"))
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 5)
                }
            
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        CarInfoItem(image: "speedometer", imageWidth: 25, imageHeight: 25, text: "250км")
                        CarInfoItem(image: "gearshape", imageWidth: 25, imageHeight: 25,
                                    text: car.transmission == 0 ? "ручная" : "автомат")
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        CarInfoItem(image: "fuelpump", imageWidth: 20, imageHeight: 20,
                                    text: car.engine == 0 ? "дизель" : "бензин")
                        CarInfoItem(image: "calendar", imageWidth: 20, imageHeight: 20, text: "от 1 суток")
                    }
                }
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 10)
            NavigationLink {
                CarDetailsView(car: car)
            } label: {
                Text("ПОДРОБНЕЕ")
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .frame(width: 300, height: 50)
                    .foregroundColor(Color.white)
                    .background(Color("universalGreen"))
                    .cornerRadius(10)
            }.padding(.bottom,10)
        }
        .background(Color("universalGray"))
        .cornerRadius(10)
        .padding(.horizontal,10)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .navigationBarTitle("назад")
    }
}

struct CarInfoItem: View {
    
    let image: String
    let imageWidth: CGFloat
    let imageHeight: CGFloat
    let text: String
    
    var body: some View {
        HStack{
            Image(systemName: image)
                .resizable()
                .frame(width: imageWidth, height: imageHeight)
                .foregroundColor(.black)
            Text(text)
                .foregroundColor(Color.black)
                .font(.system(size: 17, weight: .regular, design: .none))
        }
    }
}


struct CarSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CarSelectionView()
    }
}
