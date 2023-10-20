### Set Up Two Columns Layout 

```swift
struct HomeScreen: View {
    var body: some View {
        NavigationView {
            SideBar()
                .frame(minWidth: 300)
            MapScreen()
        } //: NavigationView
    } //: body
}

```

### Capability 

- To get user's current location

![image](./capabilities.png)
