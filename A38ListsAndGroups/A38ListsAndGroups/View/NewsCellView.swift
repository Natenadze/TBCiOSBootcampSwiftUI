//
//  NewsCellView.swift
//  A38ListsAndGroups
//
//  Created by Davit Natenadze on 21.12.23.
//

import SwiftUI

struct NewsCellView: View {
    
    let news: News
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(news.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                Text(formatDate(news.date))
            }
           
            Text(news.body)
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, HH:mm" 
        return dateFormatter.string(from: date)
    }
}

#Preview {
    NewsCellView(news: News(title: "ambavi 1", body: "iyo da ara iyo ra", date: Date()))
}
