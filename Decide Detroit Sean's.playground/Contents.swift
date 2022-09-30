import SwiftUI
import PlaygroundSupport

class Choices: Identifiable {
    var title: String
    var result: String
    var choiceArr = [Choices]()
    
    init(title:String, result:String){
        self.title = title
        self.result = result
    }
    
    func addChoice(newtitle: String, newresult: String){
        let choice = Choices(title: newtitle, result: newresult)
        choiceArr.append(choice)
    }
}



func createFrench() -> Choices {
    let og = Choices(title: "", result: "In 1701 you found DETROIT with 200 of your frenchmen")
    og.addChoice(newtitle: "Kill the Natives", newresult: "You enter war with the natives and lose half your men")
    og.addChoice(newtitle: "Come together with the natives", newresult: "You sign a treaty with the natives ")
    og.addChoice(newtitle: "Start a fur trade", newresult: "Come together to gain wealth")
    og.choiceArr[0].addChoice(newtitle: "Treats to the fur trade", newresult: "French operate seven forts to protect fur trade")
    og.choiceArr[0].choiceArr[0].addChoice(newtitle: "Go back to war with reinforcements", newresult: "French send over 400 milita and supplies")
    og.choiceArr[0].choiceArr[0].addChoice(newtitle: "Britian takes over Detroit from French", newresult: "End war and signed treaty")
    
    
    return og
}


struct MyView: View {
    var curr: Choices
    var body: some View {
        VStack{
            Text(curr.result)
            ForEach(curr.choiceArr) { el in
                NavigationLink(destination: MyView(curr: el)) {
                    Text(el.title).padding()

                }
            }
        }
        
    }
}

struct newView: View {
    var og: Choices = createFrench()
    var body: some View{
        NavigationView{
            VStack{
                MyView(curr: og)
            }.frame(width: 300, height: 900, alignment: .center)
        }
    }
    
}

var view = newView()
var currView = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = currView

//IGNORE
//var choiceTree = ["In 1701 you found DETROIT with 200 of your frenchmen" :
//                    ["Kill the Natives" : ["You enter war with the natives and lose half your men": ["Choice 1"]],
//                     "Come together with the natives" : "You sign a treaty with the natives for economic growth purposes",
//                     "Call the British" : "You enter war with the natives and lose half your men"]
//                    ]
