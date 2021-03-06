//
//  Menu.swift
//  CoffeeShop
//
//  Created by Wayne on 2020/5/25.
//  Copyright © 2020 WaynesTalk. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    @FetchRequest(entity: Product.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Product.name, ascending: false)])
    var products: FetchedResults<Product>

    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none
    }

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image("MenuBackground")
                    .resizable()

                List {
                    ForEach(self.products, id: \.id) { product in
                        MenuRowView(product: product)
                    }
                }
                    .frame(width: proxy.size.width * 0.75, height: proxy.size.height * 0.65)
            }
                .frame(width: proxy.size.width, height: proxy.size.height, alignment: .topLeading)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
