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

func createChoiceTree() -> Choices {
    let og = Choices(title: "", result: "In 1701 you found DETROIT with 200 of your frenchmen")
    og.addChoice(newtitle: "Kill the Natives", newresult: "You enter war with the natives and lose half your men")
    og.addChoice(newtitle: "Come together with the natives", newresult: "You sign a treaty with the natives for economic growth purposes")
    og.addChoice(newtitle: "Call the British", newresult: "You enter war with the natives and lose half your men")
    og.choiceArr[0].addChoice(newtitle: "Choice 1", newresult: "You clicked Choice 1")
    og.choiceArr[0].choiceArr[0].addChoice(newtitle: "Choice 1, 1", newresult: "You clicked Choice 1, 1")
    og.choiceArr[0].addChoice(newtitle: "Choice 2", newresult: "You clicked Choice 2")
    return og
}

func createHenryFordTree() -> Choices {
    let og = Choices(title: "", result: "In 1882, you, a young Henry Ford, finishes your first apprenticeship in the heart of DETROIT")
    og.addChoice(newtitle: "Go work for Thomas Edison", newresult: "Edison stock shoots up by double")
    og.choiceArr[0].addChoice(newtitle: "Continue working for Edison", newresult: "Edison suggests pivoting to something new since illumination is a no longer profitable field")
    og.choiceArr[0].choiceArr[0].addChoice(newtitle: "Pivot to cars", newresult: "You start one of the biggest car companies in the world and change Detroit forver")
    og.choiceArr[0].choiceArr[0].addChoice(newtitle: "Pivot to medicine", newresult: "You cure cancer and become immortal, the entire world bows to your knees")
    og.choiceArr[0].addChoice(newtitle: "Quit and start your own company", newresult: "Edison is ANGERED and hires a hitman against you!")
    og.choiceArr[0].choiceArr[1].addChoice(newtitle: "Move to Canada and hide out", newresult: "You stay in hiding for the rest of your life, but its ok because timbits make it worth it")
    og.choiceArr[0].choiceArr[1].addChoice(newtitle: "Hire a hitman back", newresult: "Both of you are killed by eachother")
    og.addChoice(newtitle: "Focus on working on the farm with your dear wife, Clara", newresult: "Your old boss reaches out to you about a new opportunity to work with Thomas Edison")
    og.choiceArr[1].addChoice(newtitle: "Screw off! I want to stay here with my wife", newresult: "You live a long and fufilling life as a farmer")
    og.choiceArr[1].choiceArr.append(og.choiceArr[0])
    og.addChoice(newtitle: "Try your hand at a mechanical company", newresult: "You fail and go broke")
    og.choiceArr[2].addChoice(newtitle: "Try Again", newresult: "You muster up an interview with two investors")
    og.choiceArr[2].choiceArr.append(og.choiceArr[0])
    og.choiceArr[2].choiceArr[0].addChoice(newtitle: "Make trains", newresult: "You absolutely suck at making trains, your wife leaves you, and you drink yourself to death")
    og.choiceArr[2].choiceArr[0].addChoice(newtitle: "Make cars", newresult: "Start one of the biggest car companies in Detroit")
    return og
}


struct MyView: View {
    var curr: Choices
    var body: some View {
        VStack{
            Text(curr.result).font(
                .custom(
                "AmericanTypewriter",
                fixedSize: 24).weight(.black)
            ).padding(.bottom).frame(alignment: .top)
            VStack{
            ForEach(curr.choiceArr) { el in
                NavigationLink(destination: MyView(curr: el)) {
                    Text(el.title).font(
                        .custom(
                        "AmericanTypewriter",
                        fixedSize: 20)
                    ).foregroundColor(.black).padding(.bottom)
                }
            }
        }
        }.frame(width: 300, height: 900, alignment: .center)
    }
}

struct newView: View {
    var og: Choices = createHenryFordTree()
    var body: some View{
        NavigationView{
            VStack{
                MyView(curr: og)
            }.frame(width: 400, height: 1000, alignment: .top)
        }
        .accentColor(.black)
    }
}

var view = newView()
var currView = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = currView
