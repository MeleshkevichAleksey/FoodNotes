import SwiftUI
import UserInterface
import BodyDiaryKit

struct OnboardingTemplatePageView: View {
    
    let item: OnboardingTemplatePageItem
    
    let buttonAction: () -> Void
    
    @Binding
    var isButtonEnabled: Bool
    
    @StateObject
    private var interfaceService: UserInterfaceService = DependencyResolver.shared.resolve()
    
    var body: some View {
        VStack {
            Button(LocalizedStringKey(item.buttonTitle)) {
                if isButtonEnabled {
                    buttonAction()
                }
            }
            .buttonStyle(ActionButtonStyle(isSelected: $isButtonEnabled))
        }
    }
}

#Preview {
    OnboardingTemplatePageView(item: .init(buttonTitle: "Next"),
                               buttonAction: {},
                               isButtonEnabled: .constant(true))
        .preferredColorScheme(.dark)
}