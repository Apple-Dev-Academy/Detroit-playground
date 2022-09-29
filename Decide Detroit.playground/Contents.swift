import SwiftUI
import PlaygroundSupport

class Choices: Identifiable {
    var title: String
    var result: String
    var choiceArr = [Choices]()
    
    init(title: String, result: String) {
        self.title = title
        self.result = result
    }
    
    func addChoice(newTitle: String, newResult: String) {
        let choice = Choices(title: newTitle, result: newResult)
        choiceArr.append(choice)
    }
}

func createChoiceTree() -> Choices {
    let og = Choices(title: "", result: "In 1701 you found DETROIT with 200 of your frenchmen")
    og.addChoice(newTitle: "Kill the Natives", newResult: "You enter war with the natives and lose half your men")
    og.addChoice(newTitle: "Come together with the natives", newResult: "You sign a treaty with the natives for economic growth purposes")
    og.addChoice(newTitle: "Call the British", newResult: "You enter war with the natives and lose half your men")
    og.choiceArr[0].addChoice(newTitle: "Choice 1", newResult: "You clicked Choice 1")
    og.choiceArr[0].choiceArr[0].addChoice(newTitle: "Choice 1, 1", newResult: "You clicked Choice 1, 1")
    og.choiceArr[0].addChoice(newTitle: "Choice 2", newResult: "You clicked Choice 2")
    return og
}

func createHenryFordTree() -> Choices {
    let og = Choices(title: "Henry Ford", result: "In 1882, you, a young Henry Ford, finishes your first apprenticeship in the heart of DETROIT")
    og.addChoice(newTitle: "Go work for Thomas Edison", newResult: "Edison stock shoots up by double")
    og.choiceArr[0].addChoice(newTitle: "Continue working for Edison", newResult: "Edison suggests pivoting to something new since illumination is a no longer profitable field")
    og.choiceArr[0].choiceArr[0].addChoice(newTitle: "Pivot to cars", newResult: "You start one of the biggest car companies in the world and change Detroit forever")
    og.choiceArr[0].choiceArr[0].addChoice(newTitle: "Pivot to medicine", newResult: "You cure cancer and become immortal, the entire world bows to your knees")
    og.choiceArr[0].addChoice(newTitle: "Quit and start your own company", newResult: "Edison is ANGERED and hires a hitman against you!")
    og.choiceArr[0].choiceArr[1].addChoice(newTitle: "Move to Canada and hide out", newResult: "You stay in hiding for the rest of your life, but its ok because timbits make it worth it")
    og.choiceArr[0].choiceArr[1].addChoice(newTitle: "Hire a hitman back", newResult: "Both of you are killed by eachother")
    og.addChoice(newTitle: "Focus on working on the farm with your dear wife, Clara", newResult: "Your old boss reaches out to you about a new opportunity to work with Thomas Edison")
    og.choiceArr[1].addChoice(newTitle: "Screw off! I want to stay here with my wife", newResult: "You live a long and fufilling life as a farmer")
    og.choiceArr[1].choiceArr.append(og.choiceArr[0])
    og.addChoice(newTitle: "Try your hand at a mechanical company", newResult: "You fail and go broke")
    og.choiceArr[2].addChoice(newTitle: "Try Again", newResult: "You muster up an interview with two investors")
    og.choiceArr[2].choiceArr.append(og.choiceArr[0])
    og.choiceArr[2].choiceArr[0].addChoice(newTitle: "Make trains", newResult: "You absolutely suck at making trains, your wife leaves you, and you drink yourself to death")
    og.choiceArr[2].choiceArr[0].addChoice(newTitle: "Make cars", newResult: "Start one of the biggest car companies in Detroit")
    return og
}

func modernDetroit() -> Choices {
    let og = Choices(title: "20th", result: "In the early 20th century a new industry grew up in Detroit – making cars.")
    og.addChoice(newTitle: "2001", newResult: "In 2001 a statue of the French founder of Detroit Antoine de la Mothe was erected in the city. Meanwhile, Comerica Park baseball stadium opened in 2000 and Ford Field football stadium opened in 2002.")
    og.choiceArr[0].addChoice(newTitle: "2006", newResult: "The Museum of Contemporary Art Detroit opened in 2006")
    og.choiceArr[0].choiceArr[0].addChoice(newTitle: "2012", newResult: "The Michigan Science Center opened in 2012.")
    og.choiceArr[0].choiceArr[0].addChoice(newTitle: "Bankruptcy", newResult: "The 2010s were a difficult decade for Detroit. The city filed for bankruptcy in 2013. However, it exited bankruptcy in 2014.")
    og.choiceArr[0].addChoice(newTitle: "Raise of Detroit", newResult: "In 2017 the population of Detroit was 673,000. (It has fallen drastically since its peak of nearly 1.85 million in 1950).")
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

struct NewView: View {
    var og: Choices = createHenryFordTree()
    var body: some View{
        NavigationView{
            VStack{
                MyView(curr: og).navigationTitle(og.title)
            }.frame(width: 400, height: 1000, alignment: .top)
        }
        .accentColor(.black)
    }
}


var currView = UIHostingController(rootView: NewView())
PlaygroundPage.current.liveView = currView
