//
//  Menu.swift
//  LittleLemon SwiftUI
//
//  Created by Ahmed Nabil on 31/03/2024.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text("Little Lemon").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold)
            Text("Chicago")
                .font(.subheadline)
            Text("ldlskfjlksdjflksdjflksdfjlllskdfjlksdjflksdfjlskdfjlsfsldkfjlskdfjldsfkjfdsldkfjlskdfj")
            TextField("Search menu", text : $searchText)
            FetchedObjects(predicate: buildPredicate($searchText),sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
            List {
                ForEach(dishes){ dish in
                    HStack {
                        Text("\(dish.title ?? "" ) : \(dish.price ?? "")")
                        AsyncImage(
                            url: URL(string: dish.image ?? ""),
                            content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 100, maxHeight: 100)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                    }
                    
                }
            }
        }
        }.onAppear {
            getMenuData()
        }
        
    }
    
    func getMenuData() {
        PersistenceController.shared.clear()
        let urlString: String = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        guard let url = URL(string: urlString) else {
            print("Invalid URL: \(urlString)")
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle response
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                print("HTTP response code \(httpResponse.statusCode)")
                return
            }
            
            if let data = data {
                // Parse data here
                // Example: decode JSON or process raw data
                print("Received data: \(data)")
                let decoder = JSONDecoder()
                let menuList = try? decoder.decode(MenuList.self, from: data)
                menuList?.menu.forEach { menuItem in
                    let dish = Dish(context: viewContext)
                    dish.id = Int32(menuItem.id)
                    dish.title = menuItem.title
                    dish.price = menuItem.price
                    dish.image = menuItem.image
                    dish.category = menuItem.category
                    dish.details = menuItem.details
                }
                try? viewContext.save()
            }
            
        }
        task.resume()
    }
}

func buildSortDescriptors() -> [NSSortDescriptor] {
    
    return [
        NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))
    ]
}

func buildPredicate(_ searchText: Binding<String>) -> NSPredicate {
    if searchText.wrappedValue.isEmpty {
        return NSPredicate(value: true)
    }
    return NSPredicate(format: "title CONTAINS[cd] %@", searchText.wrappedValue)
}

#Preview {
    Menu()
}
