//
//  FreelancerListView.swift
//  Progress
//
//  Created by Fenuku kekeli on 7/8/24.
//

import SwiftUI

struct FreelancerListView: View {
    @Binding var searchText: String
    @State private var sortByRating = false
    
    let freelancers = [
        Freelancer(name: "Jennifer K.", role: "UI/UX Designer", rate: "$52 per hour", experience: "9 months of experience", project: "Project Work", rating: 3.7, image: "jennifer", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin volutpat vehicula ipsum, id aliquet sapien volutpat non."),
        Freelancer(name: "Adriana Sun", role: "UI/UX Designer", rate: "$22 per hour", experience: "9 months of experience", project: "Project Work", rating: 4.1, image: "adriana", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin volutpat vehicula ipsum, id aliquet sapien volutpat non."),
        Freelancer(name: "Julia Clark", role: "UI/UX Designer", rate: "$92 per hour", experience: "9 months of experience", project: "Project Work", rating: 4.7, image: "julia", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin volutpat vehicula ipsum, id aliquet sapien volutpat non."),
        Freelancer(name: "Keli.Dev", role: "UI/UX Designer", rate: "$22 per hour", experience: "9 months of experience", project: "Project Work", rating: 4.1, image: "adriana", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin volutpat vehicula ipsum, id aliquet sapien volutpat non."),
        Freelancer(name: "Jennifer K.", role: "UI/UX Designer", rate: "$32 per hour", experience: "9 months of experience", project: "Project Work", rating: 1.7, image: "jennifer", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin volutpat vehicula ipsum, id aliquet sapien volutpat non.")
    ]
    
    var sortedFreelancers: [Freelancer] {
        sortByRating ? freelancers.sorted(by: { $0.rating > $1.rating }) : freelancers
    }
    
    var body: some View {
        VStack {
            Toggle("Sort by Rating", isOn: $sortByRating)
                .padding()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(sortedFreelancers.filter { $0.name.contains(searchText) || searchText.isEmpty }, id: \.id) { freelancer in
                        NavigationLink(destination: FreelancerDetailView(freelancer: freelancer)) {
                            FreelancerCard(freelancer: freelancer)
                        }
                        .buttonStyle(PlainButtonStyle()) // To remove default navigation link styling
                    }
                }
                .padding()
            }
        }
    }
}

struct Freelancer: Identifiable {
    let id = UUID()
    let name: String
    let role: String
    let rate: String
    let experience: String
    let project: String
    let rating: Double
    let image: String
    let description: String
}

struct FreelancerCard: View {
    let freelancer: Freelancer
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(freelancer.image)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 10)
                
                VStack(alignment: .leading) {
                    Text(freelancer.name).font(.headline)
                    Text(freelancer.role).font(.subheadline)
                }
                Spacer()
                Text(String(format: "%.1f", freelancer.rating))
                    .padding(5)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            
            Text(freelancer.rate)
                .font(.subheadline)
                .padding(.top, 5)
            
            HStack {
                Text(freelancer.project)
                Spacer()
                Text(freelancer.experience)
            }
            .padding(.vertical, 5)
            
            Text(freelancer.description)
                .font(.caption)
                .lineLimit(2)
                .padding(.top, 5)
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct FreelancerListView_Previews: PreviewProvider {
    static var previews: some View {
        FreelancerListView(searchText: .constant(""))
    }
}
