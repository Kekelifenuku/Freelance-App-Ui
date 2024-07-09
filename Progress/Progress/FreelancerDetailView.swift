//
//  FreelancerDetailView.swift
//  Progress
//
//  Created by Fenuku kekeli on 7/8/24.
//

import SwiftUI

struct FreelancerDetailView: View {
    let freelancer: Freelancer
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(freelancer.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding()
                
                Text(freelancer.name)
                    .font(.largeTitle)
                    .padding(.bottom, 5)
                
                Text(freelancer.role)
                    .font(.title2)
                    .foregroundColor(.secondary)
                
                HStack {
                    Text(freelancer.rate)
                    Spacer()
                    Text(String(format: "%.1f", freelancer.rating))
                        .padding(5)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                .padding(.vertical)
                
                HStack {
                    Text(freelancer.project)
                    Spacer()
                    Text(freelancer.experience)
                }
                .padding(.bottom)
                
                Text(freelancer.description)
                    .font(.body)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Freelancer Details")
    }
}

struct FreelancerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FreelancerDetailView(freelancer: Freelancer(name: "Julia Clark", role: "UI/UX Designer", rate: "$22 per hour", experience: "9 months of experience", project: "Project Work", rating: 4.7, image: "julia", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin volutpat vehicula ipsum, id aliquet sapien volutpat non."))
    }
}
