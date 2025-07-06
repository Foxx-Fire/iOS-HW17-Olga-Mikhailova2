
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // Захват сцены
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Создание UIWindow с использованием конструктора который принимает сцену
        let window = UIWindow(windowScene: windowScene)
        
        // Создаем омновной контроллер
        let viewController = ViewController()
       
        // Определяем viewController as rootViewController
        window.rootViewController = viewController
        
        // настройка window
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}

