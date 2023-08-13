import SwiftUI

struct CarSelectionView: View {
    @StateObject private var vm = CarViewModel()
    var body: some View {
        ScrollView {
                ForEach(vm.cars, id: \.id) {car in
                    SelectionItem(itemName: car.name, itemPrice: car.price)
                }
        }
        .onAppear(perform: vm.getCars)
    }
}

struct SelectionItem: View {
    let itemName: String
    let itemPrice: Int
    var body: some View {
        VStack{
            HStack{
                Text("\(itemName)")
                    .font(.system(.title3, design: .monospaced, weight: .bold))
                Text("\(itemPrice)$")
                    .font(.system(.title3, design: .monospaced, weight: .bold))
            }
        }
        .frame(width: 300,height: 200)
        .padding()
        .shadow(radius: 10)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
        }
    }
}

struct CarSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CarSelectionView()
    }
}
