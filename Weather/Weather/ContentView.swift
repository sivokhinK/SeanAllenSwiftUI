//
//  ContentView.swift
//  Weather
//
//  Created by Kirill Sivokhin on 07.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    let days = [
        Day(dayOfWeek: "TUE", imageName: "sun.dust.fill", temperature: 74),
        Day(dayOfWeek: "WED", imageName: "cloud.fill", temperature: 64),
        Day(dayOfWeek: "THU", imageName: "cloud.bolt.fill", temperature: 78),
        Day(dayOfWeek: "FRI", imageName: "cloud.fog.fill", temperature: 79),
        Day(dayOfWeek: "SAT", imageName: "cloud.sun.rain.fill", temperature: 81)
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: isNight ? 62 : 76)
                
                HStack(spacing: 20) {
                    ForEach(days, id: \.self) { day in
                        WeatherDayView(day: day)
                    }
                }
                
                Spacer()
                
                Button() {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                   textColor: .blue,
                                   backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var day: Day
    
    var body: some View {
        VStack(spacing: 0) {
            Text(day.dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: day.imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
//                .foregroundStyle(.yellow, .orange, .pink)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(day.temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
//                                                     isNight ? .gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct Day: Hashable {
    let dayOfWeek: String
    let imageName: String
    let temperature: Int
}
