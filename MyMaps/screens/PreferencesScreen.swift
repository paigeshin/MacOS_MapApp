//
//  PreferencesScreen.swift
//  MyMaps
//
//  Created by paige shin on 10/21/23.
//

import SwiftUI

struct PreferencesScreen: View {
    
    @AppStorage("useLightMap") var useLightMap = false 
    @AppStorage("distanceUnit") var distanceunit = DistanceUnit.miles
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            Toggle(isOn: self.$useLightMap) {
                Text("Always use light map appearance")
            }
            
            Divider()
            
            HStack {
                Text("Distance units")
                Picker("", selection: self.$distanceunit) {
                    ForEach(DistanceUnit.allCases, id: \.self) { distance in
                        Text(distance.title)
                    } //: ForEach
                } //: Picker
                .fixedSize()
                .padding(.horizontal, 20)
            } //: HStack
            
        } //: VStack
        .padding()
        .frame(minWidth: 400, minHeight: 400)
    } //: body
}

#Preview {
    PreferencesScreen()
}
